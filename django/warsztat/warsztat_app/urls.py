from django.conf.urls import patterns, url

from warsztat_app import views

urlpatterns = patterns('',
    # ex: /warsztat_app
    url(r'^$', views.index, name='index'),
    # ex: /warsztat_app/3
    url(r'^(?P<id>)/$', views.detail),
    # ex: /warsztat_app/3/results/
    #url(r'^(?P<id_wizyty>\d+)/results/$', views.results, name='results'),
    # ex: /warsztat_app/search-form/
    url(r'^search-form/$', views.search_visit_form),
    url(r'^search-visit/$', views.search_visit),
    url(r'^search-car/$', views.search_car),
    url(r'^login/$','django.contrib.auth.views.login'),
    url(r'^logout/$', views.logout_view, name='logout'),
    url(r'^register/$', views.register, name='register')
)