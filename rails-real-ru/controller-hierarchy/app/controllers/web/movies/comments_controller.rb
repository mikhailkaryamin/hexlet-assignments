module Web
  module Movies
    class CommentsController < ApplicationController
      def index
        @comments = resource_movie.comments.order(id: :desc)
      end

      def show
        @comment = Comment.find params[:id]
      end

      def new
        @comment = Comment.new
      end

      def edit
        @comment = Comment.find params[:id]
      end

      def create
        @comment = resource_movie.comments.build(permitted_comment_params)

        if @comment.save
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:alert] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @comment = Comment.find params[:id]

        if @comment.update(permitted_comment_params)
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:alert] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @comment = Comment.find params[:id]

        @comment&.destroy!

        redirect_to movie_comments_path, notice: t('.success')
      end

      private

      def permitted_comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
