class Outfit < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :pieces
  default_scope :order => "created_at DESC"
  
end
