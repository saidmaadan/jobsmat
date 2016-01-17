class CommentsController < ApplicationController

  def create
    @tip = Tip.friendly.find(params[:tip_id])
    @comment = @tip.comments.new(comment_params)
    @comment.candidate = current_candidate
    @comment.employer = current_employer
    @comment.save!

    respond_to do |format|
      format.html { redirect_to @tip}
      format.js # render comments/create.js.erb
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :tip_id, :candidate_id, :employer_id)
  end
end
