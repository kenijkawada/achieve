class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :show, :edit]

  def top
  end

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @blog
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
   @blog = Blog.find(params[:id])
    if @blog.user_id != @current_user.id
      flash[:notice] = "自分の投稿ではありません"
      redirect_to blogs_path
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    if @blog.user_id == @current_user.id
      @blog.destroy
      redirect_to blogs_path, notice:"ブログを削除しました！"
    else
      redirect_to blogs_path, notice:"自分の投稿ではありません"
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render 'new' if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
