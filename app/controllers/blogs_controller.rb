class BlogsController < ApplicationController
    before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました"
  end


  private
  def blogs_params
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
