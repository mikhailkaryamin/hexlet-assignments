class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:success] = 'Ok'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Bad'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Ok'
      redirect_to post_path(@post)
    else
      flash[:success] = 'Bad'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = 'Ok'
      redirect_to posts_path
    else
      flash[:success] = 'Bad'
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :summary, :published)
  end
end
