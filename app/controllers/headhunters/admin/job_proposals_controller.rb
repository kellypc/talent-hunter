# frozen_string_literal: true

class Headhunters::Admin::JobProposalsController < ApplicationController
  before_action :set_job_application, except: [:index]

  def index
    @job_proposal = JobProposal.all
  end

  def new
    @job_proposal = JobProposal.new
  end

  def create
    @job_proposal = JobProposal.new(job_proposal_params)

    @job_application = JobApplication.find(params[:job_proposal][:job_application_id])

    @job_proposal.job_application = @job_application
    @job_proposal.headhunter = current_headhunter

    if @job_proposal.save
      flash[:notice] = 'proposta enviada com sucesso'
      redirect_to headhunters_admin_jobs_path
    else
      flash.now[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
    @job_proposal = JobProposal.find(params[:id])
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def job_proposal_params
    params.require(:job_proposal).permit(:company_name, :init_date, :salary, :benefits)
  end
end
