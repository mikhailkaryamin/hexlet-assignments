# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
    authorize @post, :new?
  end

  def edit
    @post = Post.find params[:id]
    authorize @post, :edit?
  end

  def create
    @post = Post.new(post_params)
    authorize @post, :create?
    @post.author = current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find params[:id]
    authorize @post, :update?

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find params[:id]
    authorize @post, :destroy?

    @post&.destroy!

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end
