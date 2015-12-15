class SessionsController < ApplicationController

  def new
  end

  def create
    if
      employer = Employer.authenticate(params[:email], params[:password])
      session[:employer_id] = employer.id
      flash[:notice] = "Welcome back, #{employer.name}!"
      redirect_to (session[:intended_url] || employer)
      session[:intended_url] = nil
    
    elsif 
      candidate = Candidate.authenticate(params[:email], params[:password])
     
      if params[:remember_me]
            cookies.permanent[:auth_token] = candidate.auth_token
          else
            cookies[:auth_token] = candidate.auth_token
          end
      flash[:notice] = "Welcome back, #{candidate.name}!"
      redirect_to (session[:intended_url] || candidate)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end 
  end

  def destroy
    if current_candidate
      session.delete(:candidate_id) || cookies.delete(:auth_token)
    else current_employer
      session[:employer_id] = nil
    end
    redirect_to root_url, notice: "You have signed out!"
  end
end

end
