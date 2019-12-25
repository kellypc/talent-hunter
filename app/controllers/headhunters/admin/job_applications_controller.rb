# frozen_string_literal: true

class Headhunters::Admin::JobApplicationsController < ApplicationController
  before_action :authenticate_headhunter!
  before_action :set_job

  def index
    @job_applications = @job.job_applications
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end
end
