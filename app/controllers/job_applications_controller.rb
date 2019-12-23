class JobApplicationsController < ApplicationController
  before_action :set_job

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new

    @job_application.job = @job
    @job_application.candidate = current_candidate

    if @job_application.save
      flash[:notice] = 'Você se candidatou com sucesso'
      redirect_to job_path(@job)
    else
      flash.now[:alert] = 'Ocorreu um erro'
      render :new
    end
  end

  private

    def set_job
      @job = Job.find(params[:job_id])
    end
end
