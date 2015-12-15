class PagesController < ApplicationController
  def home
    @companies = Company.all
    @jobs = Job.all.order("created_at DESC")
  end

  def about
    @companies = Company.all
    @jobs = Job.all.order("created_at DESC")
    
  end

  def terms
  end

  def privacy
  end

  def faq
  end
end

