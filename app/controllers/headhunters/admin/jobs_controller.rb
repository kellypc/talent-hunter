# frozen_string_literal: true

class Headhunters::Admin::JobsController < ApplicationController
  before_action :authenticate_headhunter!
  before_action :set_job, only: [:show, :edit, :update]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    @headhunters = Headhunter.all
  end

  def create
    @job = Job.new(job_params)
    @job.headhunter = current_headhunter
    if @job.save
      flash[:notice] = 'Vaga cadastrada com sucesso'
      redirect_to headhunters_admin_jobs_path
    else
      flash.now[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:notice] = 'Vaga atualizada com sucesso'
      redirect_to headhunters_admin_jobs_path
    else
      flash.now[:alert] = 'Você deve preencher todos os campos'
      render :edit
    end
  end

  def inactive
    @job = Job.find(params[:job_id])
    @job.inativo!
    flash[:notice] = 'Vaga desativada com sucesso'
    redirect_to headhunters_admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, :salary, :job_level,
                                :start_date, :end_date, :local_job)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
