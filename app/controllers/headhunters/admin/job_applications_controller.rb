# frozen_string_literal: true

class Headhunters::Admin::JobApplicationsController < ApplicationController
  before_action :authenticate_headhunter!
  before_action :set_job_application, except: :index

  def index
    @job = Job.find(params[:job_id])
    @job_applications = @job.job_applications
  end

  def highlight
    @job_application.update_attribute(:highlight, true)
    redirect_to headhunters_admin_job_job_applications_path(@job_application.job.id)
  end

  def refuse
    @job_application.update_attribute(:status, 1)
    redirect_to headhunters_admin_job_job_applications_path(@job_application.job.id)
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end
end
