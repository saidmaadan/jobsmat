class PagesController < ApplicationController
  def home
    @companies = Company.order("created_at DESC")
    @jobs = Job.all.order("created_at DESC")
    @tips = Tip.all.order("created_at DESC").limit(12)
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

