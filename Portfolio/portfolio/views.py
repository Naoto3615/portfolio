from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from .models import Contact

def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

def projects_dx(request):
    return render(request, 'projects_dx.html')

def projects_web(request):
    return render(request, 'projects_web.html')

def projects_management(request):
    return render(request, 'projects_management.html')


def contact(request):
    return render(request, 'contact.html')


def contact_submit(request):
    if request.method == 'POST':
        # フォームデータを取得
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        name = f"{first_name} {last_name}"  # 姓と名を結合
        email = request.POST.get('email')
        message = request.POST.get('message')

        # 必要に応じてバリデーションや保存処理を追加
        if not name or not email or not message:
            messages.error(request, '全ての項目を入力してください。')
            return redirect('contact')

        # メール送信やデータベース保存処理をここで実行可能
        contact = Contact(name=name, email=email, message=message)
        contact.save()

        messages.success(request, 'お問い合わせ内容を送信しました。')
        return redirect('contact')  # 成功後にContactページに戻る

    return HttpResponse('Method not allowed', status=405)