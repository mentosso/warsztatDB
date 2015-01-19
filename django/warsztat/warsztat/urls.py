from django.conf.urls import patterns, include, url
from django.contrib import admin
from warsztat_app import views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'warsztat.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^warsztat_app/', include('warsztat_app.urls')),
    url(r'^admin/', include(admin.site.urls)),
)
