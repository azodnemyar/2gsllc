class MachineMeta < ActiveRecord::Base
  belongs_to :machine
  has_one :attachment, as: :attachable, dependent: :destroy
  before_create :set_attachment
  accepts_nested_attributes_for :attachment, :allow_destroy => true
  
  def set_attachment
    if self.attachment.blank?
      self.build_attachment
    end
  end
end
