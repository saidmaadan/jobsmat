class Follow < ActiveRecord::Base
  belongs_to :company
  belongs_to :candidate
  belongs_to :employer
end
