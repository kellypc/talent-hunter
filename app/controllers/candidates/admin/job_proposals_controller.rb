# frozen_string_literal: true

class Candidates::Admin::JobProposalsController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_job_proposals, except: :index

  def index
    @job_proposals = current_candidate.job_proposals
  end

  def show
  end

  private

  def set_job_proposals
    @job_proposal = current_candidate.job_proposals.find(params[:id])
  end
end
