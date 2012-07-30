require 'open-uri'

class Piece < ActiveRecord::Base
  attr_accessible :name, :link, :image, :image_remote_url
  belongs_to :user
  has_and_belongs_to_many :outfits 
  default_scope :order => "created_at DESC"
  has_attached_file :image, 
:styles => { :big => ["300x300", :jpg], :thumb => ["80x80", :jpg]},
  :url  => "/assets/images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"
  
  def image_from_url
      self.image = open(self.image_remote_url)
  end

  
end
