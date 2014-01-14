class Document < ActiveRecord::Base
  belongs_to :machine
  has_attached_file :pdf,
  :storage => :s3, 
  :s3_credentials => { 
    :access_key_id => "AKIAJ6QXR3XGAZFWGDHA", 
    :secret_access_key => "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" 
  }, 
  :bucket => "TwoGS_App"
  
  validates :pdf,    presence: true
end
