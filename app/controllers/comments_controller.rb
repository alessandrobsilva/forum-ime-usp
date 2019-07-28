class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new,  :edit, :create, :update, :destroy]
  before_action :set_comment,        only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @comment = Comment.new
    # id do post que conterá o novo comentário
    @@post_id = params[:id].to_i
  end

  def show
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    # id do post que contém o novo comentário
    @comment.post_id = @@post_id
    # id do usuário que criou o comentário
    @comment.user_id = current_user.id
    # id do curso que contém o novo comentário
    @comment.course_id = @comment.post.course.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: t(:comment_created) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: t(:comment_updated) }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: t(:comment_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :picture)
  end

end
