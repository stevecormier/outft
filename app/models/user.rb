require 'digest'

class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :avatar, :location, :about
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40}
  validates :name , :presence => true, :length => { :maximum => 50 }, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  
  has_attached_file :avatar, :styles => { :profile => "250x400",
                                          :thumb => "80x80",
                                          :small => "40x40"},
                            :url  => "/assets/avatars/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
  
  has_many :pieces, :dependent => :destroy
  has_many :outfits, :dependent => :destroy
  
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nill if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user :nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
      
  private
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
