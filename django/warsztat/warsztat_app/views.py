# -*- coding: utf-8 -*-
from datetime import datetime, timedelta
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.template import RequestContext, loader
from django.shortcuts import render
from warsztat_app.models import Wizyta, Samochod, Uzytkownik
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from smsapi.client import SmsAPI
from smsapi.responses import ApiError


def validate_password_strength(value):
    min_length = 5

    if len(value) < min_length:
        return False

    # check for digit
    else:
        if not any(char.isdigit() for char in value):
            return False

        else:
            # check for letter
            if not any(char.isalpha() for char in value):
                return False
            else:
                return True


def index(request):
    return render(request, 'warsztat_app/index.html')


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/warsztat_app/')


def register(request):
    if not request.user.is_authenticated():
        if request.method == 'POST':
            username = request.POST['login']
            password = request.POST['password']
            mail = request.POST['mail']
            imie = request.POST['imie']
            nazwisko = request.POST['nazwisko']
            if validate_password_strength(password) and len(username) > 5:
                user = User.objects.create_user(username, mail, password, first_name=imie, last_name=nazwisko)
                return HttpResponseRedirect('/warsztat_app/login/')
            else:
                return render(request, 'warsztat_app/register.html', {'status': 0})
        else:
            return render(request, 'warsztat_app/register.html')
    else:
        return HttpResponseRedirect('/warsztat_app/')


def detail(request, id):
    uzytkownik = Samochod.objects.get(pk=id)
    return HttpResponse("Numer rejestracyjny samochodu %s." % uzytkownik.nr_rejestracyjny)


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
        samochody = Samochod.objects.distinct().filter(przebieg__gte=100000).exclude(wizyta__data__gte=time_threshold).select_related()
        api = SmsAPI('grzez.magik@gmail.com', 'baba6b0565a01138b7a63dab17bca5ae')

        #sending SMS
        try:
            for samochod in samochody:
                uzytkownik = User.objects.get(username=samochod.id_uzytkownika)
                telefon = Uzytkownik.objects.get(id=uzytkownik.id)

                api.service('sms').action('send')
                api.set_content('Witaj [%1%] [%2%]. Warsztat Samochodowy Grzemar Repair przypomina o zbizajacej sie koniecznosci wykonania przegladu technicznego dla samochodu o numerze rejestracyjnym [%3%].')
                api.set_params(uzytkownik.first_name, uzytkownik.last_name, samochod.nr_rejestracyjny) #Trzeba wstawic dane klienta z bazy
                api.set_to(telefon.nr_telefonu) #Pole z nr tel - trzeba wstawic z bazy danych nr klienta bedacego wlascicielem wyszukanego auta
                api.set_from('ECO') #Pole nadawcy lub typ wiadomości 'Info', 'ECO', '2Way' - najlepiej zostawic 'ECO'
                result = api.execute()
        except ApiError as e:
            return HttpResponse('%i, %s' % (e.code, e.message))

        return render(request, 'warsztat_app/search_car.html', {'samochody': samochody})
    else:
        return HttpResponseRedirect('/warsztat_app/login/')

