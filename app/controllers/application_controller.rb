class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.present? && resource.is_a?(Candidate)
        if current_candidate.profile.nil? || current_candidate.profile.pending?
          new_candidates_profile_path
        else
          root_path
        end
      elsif resource.present? && resource.is_a?(Headhunter)
        headhunters_admin_jobs_path
      else
        super
      end
  end
end
