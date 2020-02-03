class Api::V1::JobApplicationsController < Api::V1::ApiController
  def show
    @job_application = JobApplication.find(params[:id])
    render json: @job_application, status: :ok
  end

  def create
    if params[:job_application].nil?
      render json: 'Object not found', status: 412
    else
      @job_application = JobApplication.new(params.require(:job_application).permit(
                                                            :job_id, :candidate_id))

        if @job_application.valid?
          @job_application.save!
          render json: @job_application
        else
          render json: {"message": @car.errors.full_messages}, status: 412

        end
    end
  end
end
