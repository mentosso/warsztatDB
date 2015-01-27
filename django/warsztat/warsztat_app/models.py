# -*- coding: utf-8 -*-
from django.db import models
from django.core import validators
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User





STANOWISKO_CHOICE = (
    ('mech', 'Mechanik'),
    ('wlas', 'Własciciel'),
    ('kli', 'Klient'),
    ('adm', 'Administrator'),
)

DZIAL_CHOICE = (
    ('wulk', 'Wulkanizacja'),
    ('elek', 'Elektronika'),
    ('bla', 'Blacharstwo'),
    ('mech', 'Mechanika'),
)

STAN_CHOICE = (
    ('rez', 'rezerwacja'),
    ('potw', 'potwierdzenie'),
    ('w_napr', 'w naprawie'),
    ('onc', 'oczekiwanie na czesci'),
    ('zak', 'zakonczona'),
)

STATUS_CHOICE = (
    ('zaj', 'Zajęty'),
    ('wol', 'Wolny'),
)
# Create your models here.
class Uzytkownik(models.Model):
    user = models.OneToOneField(User)
    PESEL = models.CharField(max_length=11, validators=[validators.MinLengthValidator(11)])
    NIP = models.CharField(max_length=10, blank=True, validators=[validators.MinLengthValidator(10)])
    data_zatrudnienia = models.DateField()
    wynagrodzenie = models.PositiveIntegerField(null=True, blank=True, )
    data_urodzenia = models.DateField()
    adres = models.CharField(max_length=50)
    nr_telefonu = models.CharField(max_length=9, null=True, blank=True, validators=[validators.MinLengthValidator(9)])
    stanowisko = models.CharField(max_length=4, choices=STANOWISKO_CHOICE, null=True, blank=True)
    dzial = models.CharField(max_length=4, choices=DZIAL_CHOICE)

    def __str__(self):  # __unicode__ on Python 2
        return self.user.username


class Samochod(models.Model):
    marka = models.CharField(max_length=30)
    model = models.CharField(max_length=30)
    nr_rejestracyjny = models.CharField(max_length=10, primary_key=True, db_index=True)
    nr_VIN = models.CharField(max_length=17, unique=True, validators=[validators.MinLengthValidator(17)])
    przebieg = models.PositiveIntegerField(db_index=True)
    id_uzytkownika = models.ForeignKey(User, db_column='id_uzytkownika', db_index=True)

    def __str__(self):  # __unicode__ on Python 2
        return self.nr_rejestracyjny

    @property
    def ostatnia_wizyta(self):
            wizyty = Wizyta.objects.filter(nr_rejestracyjny=self.nr_rejestracyjny)
            wizyty = wizyty.order_by('-data')
            return wizyty[0].data

class Czesci(models.Model):
    id_czesci = models.IntegerField(primary_key=True, db_index=True)
    nazwa = models.CharField(max_length=50)
    producent = models.CharField(max_length=50)
    cena_w_hurtowni = models.DecimalField(max_digits=7, decimal_places=2)

    def __str__(self):  # __unicode__ on Python 2
        return self.nazwa


class Sprzet(models.Model):
    id_sprzetu = models.IntegerField(primary_key=True, db_index=True)
    nazwa_sprzetu = models.CharField(max_length=20, db_index=True)
    status = models.CharField(max_length=3, choices=STATUS_CHOICE)
    opis = models.CharField(max_length=200)
    data_przegladu = models.DateField()

    def __str__(self):  # __unicode__ on Python 2
        return self.nazwa_sprzetu


class Wizyta(models.Model):
    id_wizyty = models.IntegerField(primary_key=True, db_index=True)
    data = models.DateField(db_index=True)
    status = models.CharField(max_length=6, choices=STAN_CHOICE, db_index=True)
    id_uzytkownika = models.ForeignKey(User, db_column='id_uzytkownika', db_index=True)
    nr_rejestracyjny = models.ForeignKey(Samochod, db_column='nr_rejestracyjny', db_index=False)
    przebieg_w_momencie_wizyty = models.PositiveIntegerField()
    opis = models.CharField(max_length=200)
    id_czesci = models.ForeignKey(Czesci, db_column='id_czesci', null=True, blank=True)
    cena = models.PositiveIntegerField()
    czas_pracownikow = models.PositiveIntegerField(validators=[validators.MaxValueValidator(1000)])
    id_sprzetu = models.ForeignKey(Sprzet, db_column='id_sprzetu', db_index=True, null=True, blank=True)

    def __str__(self):  # __unicode__ on Python 2
        return str(self.id_wizyty)

"""
class Uprawnienia(models.Model):
	id_uzytkownika = models.ForeignKey(Uzytkownik, db_column='id_uzytkownika', db_index=True)
	upr1 = models.NullBooleanField()
"""
"""
class Termin(models.Model):
	termin = models.DateField(primary_key=True)
	is_taken = 
"""