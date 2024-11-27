from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpRequest
from django.contrib.auth.decorators import login_required
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth import login, authenticate, logout
from django.forms import ModelForm
from .models import Barbero, Servicio, Reserva
from django.contrib.auth.hashers import check_password
from datetime import datetime, time, timedelta
from django.contrib.admin.views.decorators import staff_member_required
from django.core.paginator import Paginator
from django.http import JsonResponse

def principal(request):
    return render(request, "principal.html")

def servicios(request):
    return render(request, "servicios.html")

def sucursal(request):
    return render(request, "sucursal.html")

def equipo(request):
    return render(request, "equipo.html")

def login_view(request: HttpRequest):
    if request.method == 'POST':
        username = request.POST.get('email') 
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            return render(request, "login.html", {"error": "Usuario o contraseña incorrectos"})
    return render(request, "login.html")

def register(request: HttpRequest):
    if request.method == 'POST':
        email = request.POST.get('email')
        firstname = request.POST.get('firstname')
        lastname = request.POST.get('lastname')
        pass1 = request.POST.get('password')
        pass2 = request.POST.get('repassword')
        if pass1 == pass2:
            user = User.objects.create_user(username=email, email=email, password=pass1)
            user.first_name = firstname
            user.last_name = lastname
            user.save()
            return redirect('/login')
    return render(request, "register.html")

def generar_horas():
    horas = []
    inicio = time(9, 0) 
    fin = time(18, 0)    
    intervalo = timedelta(minutes=10)

    actual = datetime.combine(datetime.today(), inicio)
    fin_datetime = datetime.combine(datetime.today(), fin)

    while actual <= fin_datetime:
        horas.append(actual.time())
        actual += intervalo

    return horas

@login_required
def reserva(request: HttpRequest):
    if request.method == 'POST':
        barbero_id = request.POST.get('barbero')
        servicio_id = request.POST.get('servicio')
        date = request.POST.get('date')
        time = request.POST.get('time')  
        if date and time:
            fecha_str = f"{date} {time}"
            fecha = datetime.strptime(fecha_str, "%Y-%m-%d %H:%M")

            barbero = get_object_or_404(Barbero, id=barbero_id)
            servicio = get_object_or_404(Servicio, id=servicio_id)

            reserva = Reserva(cliente=request.user, barbero=barbero, servicio=servicio, fecha=fecha)
            reserva.save()

            return redirect('/mis_reservas')
        else:
            error_message = 'Por favor selecciona una fecha y hora válidas'
            return render(request, 'reserva.html', {
                'barberos': Barbero.objects.all(),
                'servicios': Servicio.objects.all(),
                'horas': generar_horas(),
                'error': error_message
            })

    barberos = Barbero.objects.all()
    servicios = Servicio.objects.all()

    return render(request, 'reserva.html', {
        'barberos': barberos,
        'servicios': servicios,
        'horas': generar_horas(),
    })

@login_required 
def mis_reservas(request: HttpRequest):
    if request.user.is_staff:
        reservas = Reserva.objects.all()
    else:
        reservas = Reserva.objects.filter(cliente=request.user)
    return render(request, 'mis_reservas.html', {'reservas': reservas})


def dashboard(request: HttpRequest):
    if not request.user.is_anonymous:
        return render(request, 'dashboard.html')
    mensaje = 'Usted no está autorizado para acceder a este apartado. Por favor Registrarse / Iniciar sesión'
    return render(request, 'error.html', {'mensaje': mensaje})


def cambiar_contraseña(request: HttpRequest):
    if not request.user.is_anonymous:
        if request.method == 'POST':
            current_pass = request.POST.get('currentpass')

            if check_password(current_pass, request.user.password):
                pass1 = request.POST.get('newpass')
                pass2 = request.POST.get('renewpass')

                if pass1 == pass2:
                    request.user.set_password(pass2)
                    request.user.save()
                    return redirect('/dashboard/')
                else:
                    mensaje = 'Las contraseñas no coinciden'
                    return render(request, "cambiar_contraseña.html", {'mensaje': mensaje})
            else:
                mensaje = 'La contraseña actual es incorrecta'
                return render(request, "cambiar_contraseña.html", {'mensaje': mensaje})
        return render(request, "cambiar_contraseña.html")
    mensaje = 'Usted no está autorizado para acceder a esta opción'
    return render(request, 'error.html', {'mensaje': mensaje})


@staff_member_required
def agregar_barbero(request, barbero_id=None):
    barbero = None
    if barbero_id:
        barbero = get_object_or_404(Barbero, id=barbero_id)

    if request.method == "POST":
        nombre = request.POST.get('nombre')
        especialidad = request.POST.get('especialidad')
        email = request.POST.get('email')
        password = request.POST.get('password')

        if barbero:
            user = barbero.user
            barbero.nombre = nombre
            barbero.especialidad = especialidad
            user.username = email
            user.email = email
            if password:
                user.set_password(password)
            user.save()
            barbero.save()
        else:

            user = User.objects.create_user(username=email, email=email, password=password, is_staff=True)
            Barbero.objects.create(user=user, nombre=nombre, especialidad=especialidad)

        return redirect('gestionar_barberos')

    return render(request, 'agregar_barbero.html', {'barbero': barbero})


@staff_member_required
def eliminar_barbero(request: HttpRequest, barbero_id):
    barbero = get_object_or_404(Barbero, id=barbero_id)
    barbero.user.delete() 
    barbero.delete()
    return redirect('/dashboard')

@staff_member_required
def gestionar_citas(request: HttpRequest):
    estado = request.GET.get('estado', '')
    search_query = request.GET.get('search', '')

    citas = Reserva.objects.all()
    if search_query:
        citas = citas.filter(cliente__username__icontains=search_query)
    if estado:
        if estado == 'Pagado':
            citas = citas.filter(confirmada=True)
        elif estado == 'Pendiente':
            citas = citas.filter(confirmada=False)
        elif estado == 'Cancelado':
            citas = citas.filter(confirmada=None)

    paginator = Paginator(citas, 10)
    page_number = request.GET.get('page')
    page_citas = paginator.get_page(page_number)

    if request.method == 'POST':
        reserva_id = request.POST.get('reserva_id')
        accion = request.POST.get('accion')

        try:
            reserva = Reserva.objects.get(id=reserva_id)

            if accion == 'pagado':
                reserva.confirmada = True
            elif accion == 'cancelado':
                reserva.confirmada = None
            reserva.save()

        except Reserva.DoesNotExist:
            pass  

        return redirect('/gestionar_citas')  

    return render(request, 'gestionar_citas.html', {'citas': page_citas, 'estado': estado, 'search_query': search_query})

@login_required
def validar_turno(request: HttpRequest):
    if request.method == 'POST':
        barbero_id = request.POST.get('barbero')
        fecha_str = request.POST.get('fecha')
        fecha = datetime.strptime(fecha_str, "%Y-%m-%d %H:%M")

        if Reserva.objects.filter(barbero_id=barbero_id, fecha=fecha).exists():
            error_message = "El barbero ya tiene un turno reservado en esa hora."
            barberos = Barbero.objects.all()
            servicios = Servicio.objects.all()
            return render(request, 'reserva.html', {
                'barberos': barberos,
                'servicios': servicios,
                'error': error_message
            })

        servicio_id = request.POST.get('servicio')
        barbero = get_object_or_404(Barbero, id=barbero_id)
        servicio = get_object_or_404(Servicio, id=servicio_id)

        reserva = Reserva(cliente=request.user, barbero=barbero, servicio=servicio, fecha=fecha)
        reserva.save()

        return redirect('/mis_reservas')
    return redirect('/reserva')

@staff_member_required
def agregar_servicio(request: HttpRequest):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')

        Servicio.objects.create(nombre=nombre, descripcion=descripcion, precio=precio)
        return redirect('/dashboard')  

    return render(request, 'agregar_servicio.html')

@staff_member_required
def asignar_admin_barbero(request: HttpRequest):
    if request.method == 'POST':
        barbero_id = request.POST.get('barbero_id')
        barbero = get_object_or_404(Barbero, id=barbero_id)

        barbero.user.is_staff = True
        barbero.user.save()

        return redirect('/dashboard')

    barberos = Barbero.objects.all()
    return render(request, 'asignar_admin.html', {'barberos': barberos})


@staff_member_required
def visualizar_pedidos(request: HttpRequest):
    pedidos = Reserva.objects.all().order_by('fecha')
    return render(request, 'visualizar_pedidos.html', {'pedidos': pedidos})

@login_required
def dashboard(request):
    if not request.user.is_staff:
        return render(request, 'error.html', {'mensaje': 'Acceso denegado'})
    return render(request, 'dashboard.html')


def logout_view(request: HttpRequest):
    logout(request)
    return redirect('/')

@staff_member_required
def gestionar_barberos(request):
    barberos = Barbero.objects.all()

    if request.method == "POST":
        accion = request.POST.get('accion')
        if accion == "eliminar":
            barbero_id = request.POST.get('barbero_id')
            barbero = get_object_or_404(Barbero, id=barbero_id)
            barbero.user.delete()  
            barbero.delete()
            return redirect('gestionar_barberos')

    return render(request, 'gestionar_barberos.html', {'barberos': barberos})