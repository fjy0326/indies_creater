class Music < ApplicationRecord
  belongs_to :post
  mount_uploader :file, AudiofileUploader
  
end
