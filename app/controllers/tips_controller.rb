class TipsController < ApplicationController
  before_action :require_author, except: [:index, :show]
  
  def index
    @tips = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      redirect_to @tip
    else
      render :new
    end
  end

  def show
    @tip = Tip.friendly.find(params[:id])
  end

  def edit
    @tip = Tip.friendly.find(params[:id])
  end

  def update
    @tip = Tip.friendly.find(params[:id])
    if @tip.update(tip_params)
      redirect_to @tip, notice: "Your post has been updated"
    else
      render :edit
    end
  end

  def delete
    @tip = Tip.friendly.find(params[:id])
    @tip.destroy
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :content,:source_url, :slug, :employer_id, :logo)
  end
end
