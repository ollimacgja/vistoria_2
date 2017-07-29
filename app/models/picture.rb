class Picture < ActiveRecord::Base
  mount_base64_uploader :file, FileUploader

  belongs_to :answer
end
