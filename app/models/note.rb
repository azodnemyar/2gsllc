class Note < ActiveRecord::Base
  belongs_to :machine
  
  validates :subject, presence: true
  validates :body,    presence: true, length: { maximum: 300 }
end
