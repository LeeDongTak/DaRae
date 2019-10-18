from django.shortcuts import render, redirect
from ordersystem.forms import *
from ordersystem.models import Destination

# Create your views here.
def postal(request):
    if request.method == 'POST':
        form = Form(request.POST)
        if form.is_valid():
            form.save()
    else:
        form = Form() 
    return render(request,'ordersystem/posttest.html',{'form':form})

def postresult(request):
    destinationList = Destination.objects.all()
    return render(request,'ordersystem/postresult.html',{'destinationList':destinationList})

def orderwrite(request):
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            form.save()
    else:
        form = OrderForm() 
    return render(request,'ordersystem/orderwrite.html',{'form':form})   


def orderlist(request): 
    orderList = Orders.objects.all()
    return render(request,'ordersystem/orderlist.html',{'orderList':orderList})

def orderdetail(request, id): 
    order = Orders.objects.get(id=id)
    return render(request,'ordersystem/orderdetail.html',{'order':order})

def goodslist(request): 
    goodsList = Goods.objects.all()
    return render(request,'ordersystem/goodslist.html',{'goodsList':goodsList})

def delete(request, good_id):
    goods = Goods.objects.get(id=good_id)
    goods.delete()
    return redirect('/ordersystem/goodslist/')

def delete_2(request, pst_id):
    pores = Destination.objects.get(id=pst_id)
    pores.delete()
    return redirect('/ordersystem/postresult/')

def delete_3(request, orst_id):
    orst = Orders.objects.get(id=orst_id)
    orst.delete()
    return redirect('/ordersystem/orderlist/')
