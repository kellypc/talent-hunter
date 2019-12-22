class Candidates::ProfilesController < ApplicationController
  before_action :authenticate_candidate!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.candidate = current_candidate
    if @profile.save!
      flash[:notice] = 'Perfil criado com sucesso'
      redirect_to candidates_profile_path(@profile)
    else
      flash.now[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :social_name, :title, :bith_date,
                                     :academic_formation, :description, :experience,
                                     :address, :phone_number, :skills, :avatar)

  end
end
