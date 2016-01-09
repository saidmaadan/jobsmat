class Tip < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  belongs_to :employer
  has_many :comments
  
  extend FriendlyId
  friendly_id :slug_tips, use: :slugged
  
  def slug_tips
    [
      :title,
      [:title, :source_url]
    ]
  end
end
