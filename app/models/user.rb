class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  before_create :create_remember_token
  
  has_one :attachment, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachment, :allow_destroy => true
  
  has_many :tasks, as: :taskable, dependent: :destroy
  
  validates :name,      presence: true, length: { maximum: 50 }
  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  length: { minimum: 6 }, on: :create
  validates :password,  length: { minimum: 6 }, on: :update, allow_blank:true
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
private
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
    
end
