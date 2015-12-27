class Tip < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  belongs_to :employer
  extend FriendlyId
  friendly_id :slug_tips, use: :slugged
  
  def slug_tips
    [
      :title,
      [:title, :source_url]
    ]
  end
end
