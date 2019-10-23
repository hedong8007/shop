from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
def test(request,username):
    result={'code':200}
    return JsonResponse(result)