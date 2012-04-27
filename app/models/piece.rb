class Piece < ActiveRecord::Base
  attr_accessible :name, :link, :image
  belongs_to :user
  has_and_belongs_to_many :outfits 
  has_attached_file :image, :styles => { :big => "300x300", :thumb => "80x80"}
  
end
