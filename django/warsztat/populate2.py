import random
from warsztat_app.models import Czesci

for _ in xrange(0, 2):
    m = Czesci(id_czesci=random.randint(1, 9999), nazwa="Oslona", producent="Test",
               cena_w_hurtowni=random.randint(1, 100))
    m.save()