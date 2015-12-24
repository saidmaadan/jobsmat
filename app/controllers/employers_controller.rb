class EmployersController < ApplicationController
  before_action :require_signin, except: [:new, :create, :home]
  before_action :require_correct_employer, only: [:edit, :update, :delete]
  before_action :require_admin, only: [:delete]
  
  # def search
  #   if params[:search].present?
  #     @employers = Employer.search(params[:search])
  #   else
  #     @employers = Employer.order("created_at DESC").limit(4)
  #   end
  # end
  
  def index
    @employers = Employer.all 
  end

  def show
    @employer = Employer.friendly.find(params[:id])
    @jobs = @employer.jobs.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

  def home
    @employer = Employer.new
  end

  def new
    @employer = Employer.new
  end

  def edit
    @employer = Employer.friendly.find(params[:id])
    @jobs = @employer.jobs.order("created_at DESC")
  end

  def editprofile
    @employer = Employer.friendly.find(params[:id])
    @jobs = @employer.jobs.order("created_at DESC")
  end

  def update
    @employer = Employer.friendly.find(params[:id])
    if @employer.update(employer_params)
      redirect_to @employer
    else
      render :edit
    end
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id
      redirect_to @employer, notice: "Thanks for signing up as employer!"
    else
      render :new
    end
  end

  def destroy
    @employer = Employer.friendly.find(params[:id])
    @employer.destroy
    redirect_to root_path, alert: "Account has been deleted, sorry to see you going!"
  end

  private

  def require_correct_employer
    @employer = Employer.friendly.find(params[:id])
      redirect_to root_url unless current_employer?(@employer)
  end

  helper_method :require_correct_employer

  def employer_params
    params.require(:employer).permit(:name, :email, :password, :password_confirmation, :username, :company_name, :location,
      :zip_code,:twitter,:linkedin,:facebook,:website_url, :instagram, :company_description, :logo, :headlines, :industry, :company_size, :skype_id, :phone_number, :EmpImage, :emp_image, :auth_token)
  end
end