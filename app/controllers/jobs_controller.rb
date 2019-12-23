class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @job_application = JobApplication.new
  end
end
