class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_movie, only: %i[create destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.movie = @movie
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:body, :movie_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
