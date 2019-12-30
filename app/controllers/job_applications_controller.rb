class JobApplicationsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update]

  def index
    @job_applications = JobApplication.all
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @comment = Comment.new
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new

    @job_application.job = @job
    @job_application.candidate = current_candidate

    if @job_application.save
      flash[:notice] = 'Você se candidatou com sucesso'
      redirect_to job_path(@job)
    else
      flash.now[:alert] = 'Ocorreu um erro'
      redirect_to job_path(@job)
    end
  end

  def show
    @job_application = JobApplication.new
  end

  private

    def set_job
      @job = JobApplication.find(params[:id])
    end
end
