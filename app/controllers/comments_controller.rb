class CommentsController < ApplicationController

  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :update, :new]

  def new
    @comment = Comment.new
  end

  def create

    comments_params = params.require(:comment).permit([:title, :comment])
  @comment = Comment.create comments_params

  if @comment.save
    # render :show
    redirect_to comment_path(@comment)
  else
    render :new
  end

  end

  def show
    @comment = Comment.find params[:id]
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to comments_path
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update params.require(:comment).permit([:title, :comment])
    redirect_to comment_path(@comment)
  end

  def index
    @comment = Comment.order(created_at: :desc)
  end

end
