# frozen_string_literal: true

class Candidates::Admin::JobApplicationsController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_job_application, except: :index

  def index
    @job_applications = current_candidate.job_applications
  end

  def show
    @job = @job_application.job
  end

  private

  def set_job_application
    @job_application = current_candidate.job_applications.find(params[:id])
  end
end
