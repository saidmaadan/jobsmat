class CandidatesController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :correct_candidate, only: [:edit, :update, :delete]
  before_action :require_admin, only: [:delete]

  # def search
  #   if params[:search].present?
  #     @candidates = Candidate.search(params[:search])
  #   else
  #     @candidates = Candidate.order("created_at DESC").limit(3)
  #   end
  # end
  
  def index
    @candidates = Candidate.all 
  end

  def show
    @candidate = Candidate.friendly.find(params[:id])
    @work = Work.new
    @work.candidate_id = @work_id
    @works = Work.where(candidate_id: @candidate.id).order("created_at DESC")

    @education = Education.new
    @education.candidate_id = @education_id
    @educations = Education.where(candidate_id: @candidate.id).order("created_at DESC")
    @followed_companies = @candidate.followed_companies
  end

  def new
    @candidate = Candidate.new 
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save 
      session[:candidate_id] = @candidate.id
      redirect_to @candidate, notice: "Thanks for signing up as candidate"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.friendly.find(params[:id])
  end

  def profile
    @candidate = Candidate.friendly.find(params[:id])
    @work = Work.new
    @work.candidate_id = @work_id
    @works = Work.where(candidate_id: @candidate.id).order("created_at DESC")

    @education = Education.new
    @education.candidate_id = @education_id
    @educations = Education.where(candidate_id: @candidate.id).order("created_at DESC")
  end


  def update
    @candidate = Candidate.friendly.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to @candidate
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.friendly.find(params[:id])
    @candidate.destroy
    redirect_to root_path, alert: "Account has been deleted, sorry to see you going!"
  end


  private

  def require_correct_candidate
    @candidate = Candidate.friendly.find(params[:id])
      redirect_to root_url unless current_candidate?(@candidate)
    end

  def candidate_params
    params.require(:candidate).permit(:name,:email,:password,:password_confirmation,:username,:about, :headline, :experience, :education, :desired_salary, :city, :zip_code, :country, :phone_number, :bb_pin, :github_url, :twitter_url, :linkedin_url, :dribbble_url, :facebook_url, :provider, :uid, :auth_token, :skype_id, 
      :availability, :skills, :job_type, :languages, :how_heard, :cand_image, :resume, :projects_link, :portfolio_url, :favorite_website, :image_url, :slug)
  end

end

