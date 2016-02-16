class ContactCandidate < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :job
  belongs_to :employer
end
