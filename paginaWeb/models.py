from django.db import models
from django.contrib.auth.models import User

# Modelo de Barbero
class Barbero(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100)
    especialidad = models.CharField(max_length=100)
    
    def __str__(self):
        return self.nombre

# Modelo de Servicio
class Servicio(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion  = models.TextField()
    precio = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return self.nombre

# Modelo de Reserva
class Reserva(models.Model):
    cliente = models.ForeignKey(User, on_delete=models.CASCADE)
    barbero = models.ForeignKey(Barbero, on_delete=models.CASCADE)
    servicio = models.ForeignKey(Servicio, on_delete=models.CASCADE)
    fecha = models.DateTimeField()
    confirmada = models.BooleanField(default=False)

    def __str__(self):
        return f"Cita de {self.cliente.username} con {self.barbero.nombre} para {self.servicio.nombre} - {self.fecha}"

# Método para crear datos iniciales
def crear_datos_iniciales():
    if not Barbero.objects.filter(nombre='Sergio Montecinos').exists():
        sergio = Barbero(user=User.objects.create_user(username='sergio', password='password'), nombre='Sergio Montecinos')
        sergio.save()
    
    if not Barbero.objects.filter(nombre='Francisco Gomez').exists():
        francisco = Barbero(user=User.objects.create_user(username='francisco', password='password'), nombre='Francisco Gomez')
        francisco.save()
    
    if not Barbero.objects.filter(nombre='Didier Lagos').exists():
        didier = Barbero(user=User.objects.create_user(username='didier', password='password'), nombre='Didier Lagos')
        didier.save()

    if not Servicio.objects.filter(nombre='corte de pelo').exists():
        Servicio.objects.create(nombre='corte de pelo', descripcion='Corte de cabello moderno y personalizado', precio=10.00)
    
    if not Servicio.objects.filter(nombre='perfilado de barba').exists():
        Servicio.objects.create(nombre='perfilado de barba', descripcion='Perfilado de barba con estilo', precio=8.00)

    if not Servicio.objects.filter(nombre='afeitado al ras').exists():
        Servicio.objects.create(nombre='afeitado al ras', descripcion='Afeitado clásico al ras', precio=7.00)

    if not Servicio.objects.filter(nombre='tratamiento facial').exists():
        Servicio.objects.create(nombre='tratamiento facial', descripcion='Tratamiento para el cuidado de la piel', precio=15.00)
