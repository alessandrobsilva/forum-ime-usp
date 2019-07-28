class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :set_course,         only: [:show, :edit,   :update, :destroy]

  def index
  end

  def new
    @course = Course.new
    # id do fórum que conterá o novo curso
    @@forum_id = params[:id].to_i
  end

  def show
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    # id do fórum que contém o novo curso
    @course.forum_id = @@forum_id

    respond_to do |format|
      if @course.save
        format.html { redirect_to root_path, notice: t(:course_created) }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to root_path, notice: t(:course_updated) }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: t(:course_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end

end
