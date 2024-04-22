from django.shortcuts import render, redirect, get_object_or_404, HttpResponse
from users.models import UserProfile


def is_vendor(request):
    if request.user.is_authenticated:
        user = get_object_or_404(UserProfile, username=request.user)
        is_vendor = user.groups.filter(name='vendor').exists()

        return {'is_vendor': is_vendor}
    else:
        return {'is_vendor': None}