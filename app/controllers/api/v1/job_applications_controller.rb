class Api::V1::JobApplicationsController < Api::V1::ApiController
  def show
    @job_application = JobApplication.find(params[:id])
    render json: @job_application, status: :ok
  end
end
