class ContactCandidatesController < ApplicationController
  before_action :set_contact_candidate, only: [:edit, :update, :destroy]
  before_action :set_candidate
  #before_action :check_candidate, only: [:edit, :update, :destroy]

  def new
    @contact_candidate = ContactCandidate.new
  end

  def edit
  end

  def create
    @contact_candidate = ContactCandidate.new(contact_candidate_params)
    #@contact_candidate.candidate_id = current_candidate.id
    @contact_candidate.candidate_id = @candidate.id
    respond_to do |format|
      if @contact_candidate.save
        ContactCandidateMailer.new_message(@contact_candidate).deliver_now
        format.html { redirect_to @candidate, notice: 'Your message was sent.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :candidate }
        format.json { render json: @contact_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact_candidate.update(contact_candidate_params)
        format.html { redirect_to candidate_path(@candidate), notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_candidate }
      else
        format.html { render :edit }
        format.json { render json: @contact_candidate.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @contact_candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidate_path(@candidate), notice: 'ContactCandidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact_candidate
      @contact_candidate = ContactCandidate.find(params[:id])
    end

    def set_candidate
      @candidate = Candidate.friendly.find(params[:candidate_id])
    end

    def contact_candidate_params
      params.require(:contact_candidate).permit(:name, :email, :message, :job_id, :employer_id, :candidate_id)
    end
end
