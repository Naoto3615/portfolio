from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('projects/dx/', views.projects_dx, name='projects_dx'),
    path('projects/web/', views.projects_web, name='projects_web'),
    path('projects/management/', views.projects_management, name='projects_management'),
    path('contact/', views.contact, name='contact'),
    path('contact/submit/', views.contact_submit, name='contact_submit'),  # フォーム送信用
]
