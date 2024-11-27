"""
URL configuration for barberia project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from paginaWeb import views 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.principal, name='principal'),
    path('servicios/', views.servicios, name='servicios'),
    path('reserva/', views.reserva, name='reserva'),
    path('sucursal/', views.sucursal, name='sucursal'),
    path('equipo/', views.equipo, name='equipo'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('mis_reservas/', views.mis_reservas, name='mis_reservas'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('cambiar_contraseña/', views.cambiar_contraseña, name='cambiar_contraseña'),

    # Acciones del administrador
    path('agregar_barbero/', views.agregar_barbero, name='agregar_barbero'),
    path('agregar_barbero/<int:barbero_id>/', views.agregar_barbero, name='agregar_barbero'),
    path('gestionar_citas/', views.gestionar_citas, name='gestionar_citas'),
    path('agregar_servicio/', views.agregar_servicio, name='agregar_servicio'),
    path('asignar_admin/', views.asignar_admin_barbero, name='asignar_admin_barbero'),
    path('gestionar_barberos/', views.gestionar_barberos, name='gestionar_barberos'),
    path('visualizar_pedidos/', views.visualizar_pedidos, name='visualizar_pedidos'),
]
