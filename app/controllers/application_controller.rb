class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :expire_hsts

  private

  def require_signin_employer
    unless current_employer
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "You need to login or register as employer to post job"
    end
  end
  helper_method :require_signin_employer

  def require_signin
    unless (current_candidate || current_employer)
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "You need to sign in to have access"
    end
  end

  def current_employer
    #@current_employer ||= Employer.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    @current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
  end
  helper_method :current_employer

  def current_candidate
    @current_candidate ||= Candidate.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    #@current_candidate ||= Candidate.find(session[:candidate_id]) if session[:candidate_id]
  end

  helper_method :current_candidate
  

  def current_candidate?(candidate)
    current_candidate == candidate
  end
  helper_method :current_employer?

  def current_employer?(employer)
    current_employer == employer
  end

  helper_method :current_candidate?

  def correct_candidate
    @candidate = Candidate.friendly.find(params[:id])
    unless current_candidate?(@candidate)
      redirect_to root_url
    end
  end

  def correct_candidate?
     #current_candidate == correct_candidate
     @correct_candidate == @candidate
  end
  helper_method :correct_candidate?

  def correct_employer
    @employer = Employer.friendly.find(params[:id])
    unless current_employer?(@employer)
      redirect_to root_url
    end
  end

  def correct_employer?
     #current_employer == correct_employer
     @correct_employer == @employer
  end
  helper_method :correct_employer?

  def require_admin
    unless current_candidate_admin? || current_employer_admin?
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end

  def current_employer_admin?
    current_employer && current_employer.admin?
  end

  def current_candidate_admin?
    current_candidate && current_candidate.admin?
  end

  helper_method :current_employer_admin?, :current_candidate_admin?

  def require_author
    unless current_employer_author?
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end

  def current_employer_author?
    current_employer && current_employer.author?
  end

  helper_method :current_employer_author?


  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
