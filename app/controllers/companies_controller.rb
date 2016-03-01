class CompaniesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :delete]
  before_action :set_company, only: [:show, :edit, :update, :destroy, :review, :interview, :addreview, :job, :addinterview]
  before_action :set_company_info, only: [:show, :edit, :update, :destroy, :review, :interview, :addreview, :job, :addinterview]

  def search
    if params[:search].present?
      @companies = Company.search(params[:search])
    else
      @companies = Company.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    end
    @reviews = Review.all.order("created_at DESC").limit(5)
  end

  def index
    @review = Review.new
    @review.company_id = @company_id
    #@job.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @companies = Company.all.order("created_at DESC").limit(6)
    @jobs = Job.all.order("created_at DESC")
    #@jobs = @company.jobs.all
    @companies = Company.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Company added successfully"
    else
      render :new
    end
  end

  def show
    @jobsss = Job.all.order("created_at DESC")
    # @jobs = @jobs.where(title: params["title"]) if params["title"].present?
    # @jobs = @jobs.where(city: params["city"]) if params["city"].present?
  end

  def job

  end

  def addinterview  
  end


  def interview
  end

  def addreview
  end

  def review
    @reviews = Review.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    @company = Company.friendly.find(params[:id])
  end

  def update
    @company = Company.friendly.find(params[:id])
    if @company.update(company_params)
      redirect_to @company, notice: "Company Updated"
    else
      render :edit
    end
  end

  private

  def set_company_info
    @review = Review.new
    @review.company_id = @company_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @jobbs = Job.all.order("created_at DESC").select do |job| (job.company_name == @company.name) || (job.website_url == @company.website)
    end
   
    @company.job_id = @job_id
    @jobss = Job.all.order("created_at DESC")
    @followers = @company.followers
    if current_candidate || current_employer
      @current_follow = (current_candidate || current_employer).follows.find_by(company_id: @company.id)
    end
    @reviews = Review.where(company_id: @company.id).order("created_at DESC")
    @reviewss = Review.where(company_id: @company.id).order("created_at DESC")
    @companies = Company.all.order("created_at DESC").limit(8)
    #@jobs = @company.jobs.order("created_at DESC")
    #@jobs = Job.where(company_id: @company.id).order("created_at DESC")
    @interview = Interview.new
    @interview.company_id = @company_id
    @interviewss = Interview.where(company_id: @company.id).order("created_at DESC")
    @interviews = Interview.where(company_id: @company.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 2) 
  end

  def set_company
    @company = Company.friendly.find(params[:id])
  end
  def company_params
    params.require(:company).permit(:name,:about, :founded, :size,:industry,:location,:website,:subsidiaries, :facebook, :twitter, :linkedin, :youtube, :video, :instagram, :googleplus, :pinterest, :github, :slug, :employer_id,:logo, :company_image, :twitter_username, :twitter_widget_id, :facebook_username, :twitter_widget, :candidate_id, :job_id)
  end
end
