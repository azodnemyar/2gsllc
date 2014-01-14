class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  validates :name,    presence: true
  
  scope :completed, -> { where(completed: true) }
  scope :active, -> { where(completed: false) }
  
  def self.overdue(time_now)
    where("tasks.due_date < ?", time_now)
  end
  
  scope :overdue, overdue(Time.now)
  
end
