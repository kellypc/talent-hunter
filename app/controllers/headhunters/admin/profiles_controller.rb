# frozen_string_literal: true

class Headhunters::Admin::ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
end
