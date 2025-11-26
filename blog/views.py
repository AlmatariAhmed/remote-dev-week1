

from django.core.paginator import Paginator
from django.shortcuts import render, get_object_or_404
from .models import Post

def home(request):
    post_list = Post.objects.all().order_by('-published_date')
    paginator = Paginator(post_list, 5)  # 5 منشورات لكل صفحة
    page_number = request.GET.get('page')
    posts = paginator.get_page(page_number)
    return render(request, 'blog/home.html', {'posts': posts})

def post_detail(request, slug):
    post = get_object_or_404(Post, slug=slug)
    return render(request, 'blog/post_detail.html', {'post': post})