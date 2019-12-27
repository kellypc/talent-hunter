class HomeController < ApplicationController
  def index
    @jobs = Job.all
  end

  def search
    @jobs = Job.search(params[:q])
    render :index
  end
end
