class Apply < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader
  belongs_to :candidate
  belongs_to :job
  belongs_to :employer
end
