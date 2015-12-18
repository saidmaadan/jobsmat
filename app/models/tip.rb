class Tip < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_tips, use: :slugged
  
  def slug_tips
    [
      :title,
      [:title, :source_url]
    ]
  end
end
