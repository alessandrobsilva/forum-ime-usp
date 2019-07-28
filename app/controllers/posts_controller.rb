class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,  :edit, :create, :update, :destroy]
  before_action :set_post,           only: [:show, :edit, :update, :destroy]

  def index
    # ransack
    @q = Post.ransack(params[:q])
    @posts = @q.result.sort_by{ |item| item[:title] }
  end

  def new
    @post = Post.new
    # id do curso que conterá o novo post
    @@course_id = params[:id].to_i
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    # id do curso que contém o novo post
    @post.course_id = @@course_id
    # id do usuário que criou o post
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t(:post_created) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t(:post_updated) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: t(:post_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :picture)
  end

end
