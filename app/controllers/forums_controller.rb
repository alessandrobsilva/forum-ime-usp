class ForumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,  :edit, :create, :update, :destroy]
  before_action :set_forum,          only: [:show, :edit, :update, :destroy]

  def index
    @forums = Forum.all.sort_by{ |item| item[:title] }
    # guardará o post mais recente de um curso
    @post = nil
  end

  def new
    @forum = Forum.new
  end

  def show
  end

  def edit
  end

  def create
    @forum = Forum.new(forum_params)
    respond_to do |format|
      if @forum.save
        format.html { redirect_to root_path, notice: t(:forum_created) }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to root_path, notice: t(:forum_updated) }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # apaga todos os cursos antes
    @forum.courses.each do |course|
      course.destroy
    end
    # apaga o fórum
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: t(:forum_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:title, :description)
  end

end
