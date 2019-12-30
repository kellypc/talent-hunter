class Headhunters::Admin::CommentsController < ApplicationController
  before_action :authenticate_headhunter!

  def new
    @comment = Comment.new
  end

  def create
    @profile = Profile.find(params[:profile_id])

    @comment = Comment.new(comment_params)
    @comment.profile = @profile
    @comment.headhunter = current_headhunter

    if @comment.save
      flash[:notice] = 'Comentário adicionado com sucesso'
      redirect_to headhunters_admin_profile_path(@profile)
    else
      flash.now[:alert] = 'Você deve preencher todos os campos'
      redirect_to headhunters_admin_profile_path(@profile)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
