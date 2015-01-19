from datetime import datetime, timedelta

from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from django.shortcuts import render
from warsztat_app.models import Wizyta, Samochod
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout


def index(request):
    if request.user.is_authenticated():
        return render(request, 'warsztat_app/index.html')
    else:
        return HttpResponseRedirect('/warsztat_app/login/')


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/warsztat_app/login/')

def detail(request):
    if 'query' in request.GET and request.GET['query']:
        id = request.GET['query']
        uzytkownik = User.objects.filter(id=id)
        return HttpResponse("Id uzytkownika samochodu %s." % uzytkownik.id)


def search_visit_form(request):
    if request.user.is_authenticated():
        return render(request, 'warsztat_app/search_visit_form.html')
    else:
        return HttpResponseRedirect('/warsztat_app/login/')


def search_visit(request):
    if request.user.is_authenticated():
        if 'data' and 'stan' in request.GET and request.GET['data'] and request.GET['stan']:
            data = request.GET['data']
            stan = request.GET['stan']
            wizyty = Wizyta.objects.filter(data=data)
            wizyty = wizyty.filter(status=stan)
            return render(request, 'warsztat_app/search_visit.html', {'wizyty': wizyty, 'query': data, 'stan': stan})

        else:
            if 'id' in request.GET and request.GET['id']:
                id = request.GET['id']
                wizyty = Wizyta.objects.filter(id_wizyty=id)
                return render(request, 'warsztat_app/search_visit.html', {'wizyty': wizyty, 'query': id})
            else:
                return HttpResponse('Please submit a search term.')
    else:
        return HttpResponseRedirect('/warsztat_app/login/')


def search_car(request):
    if request.user.is_authenticated():
        time_threshold = datetime.now() - timedelta(days=365)
        samochody = Samochod.objects.distinct().filter(przebieg__gte=100000).exclude(wizyta__data__gte=time_threshold)
        return render(request, 'warsztat_app/search_car.html', {'samochody': samochody})
    else:
        return HttpResponseRedirect('/warsztat_app/login/')

