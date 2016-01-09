class Comment < ActiveRecord::Base
  belongs_to :tip
  belongs_to :candidate
  belongs_to :employer
end
