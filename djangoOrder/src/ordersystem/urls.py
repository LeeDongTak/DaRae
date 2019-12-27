from django.contrib import admin
from django.urls import path,include
from . import views

app_name ='ordersystem'
urlpatterns = [
    path('postal/', views.postal,name='postal'),
    path('postresult/', views.postresult,name='postresult'),
    path('orderwrite/', views.orderwrite,name='orderwrite'),
    path('orderlist/', views.orderlist,name='orderlist'),
    path('view/<int:id>/',views.orderdetail,name='orederdetail'),
    path('goodslist/',views.goodslist,name='goodslist'),
    path('goodslist/<int:good_id>',views.goodslist, name='goodslist'),
    path('goodslist/<int:good_id>/delete',views.delete,name='delete'),
    path('postresult/<int:pst_id>',views.postresult, name='postresults'),
    path('postresult/<int:pst_id>/delete_2',views.delete_2,name='delete_2'),
    path('orderlist/<int:orst_id>',views.orderlist, name='orderlist'),
    path('orderlist/<int:orst_id>/delete_3',views.delete_3,name='delete_3'),
]

