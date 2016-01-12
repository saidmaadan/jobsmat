class FollowsController < ApplicationController
  before_action :require_signin

  # def index
  # end

  def index
    @company = Company.friendly.find(params[:company_id])
    @company.follows.create!(candidate: current_candidate)
    @company.follows.create!(employer: current_employer)
    redirect_to @company, notice: "Thanks for the follow"
  end

  def destroy
    # follow = Follow.find(params[:id])
    follow = (current_candidate.follows.find(params[:id])) || (current_employer.follows.find(params[:id]))
    follow.destroy
    @company = Company.friendly.find(params[:company_id])
    redirect_to @company
  end
end
