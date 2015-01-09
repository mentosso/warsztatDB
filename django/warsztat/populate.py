import string
import random
from warsztat_app.models import Czesci

#os.environ.setdefault("DJANGO_SETTINGS_MODULE", "warsztat.settings")
#django.setup()


def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

m = Czesci(id_czesci=random.randint(1, 9999), nazwa=id_generator(10), producent=id_generator(10), cena_w_hurtowni=random.randint(1, 100))
m.save()

m = Czesci(id_czesci=random.randint(1, 9999), nazwa=id_generator(10), producent=id_generator(10), cena_w_hurtowni=random.randint(1, 100))
m.save()

m = Czesci(id_czesci=random.randint(1, 9999), nazwa=id_generator(10), producent=id_generator(10), cena_w_hurtowni=random.randint(1, 100))
m.save()

m = Czesci(id_czesci=random.randint(1, 9999), nazwa=id_generator(10), producent=id_generator(10), cena_w_hurtowni=random.randint(1, 100))
m.save()

m = Czesci(id_czesci=random.randint(1, 9999), nazwa=id_generator(10), producent=id_generator(10), cena_w_hurtowni=random.randint(1, 100))
m.save()