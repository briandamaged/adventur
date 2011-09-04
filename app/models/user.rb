class User < ActiveRecord::Base

  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_uniqueness_of :username
  validates_presence_of   :username
  validates_presence_of   :password, :on => :create
  validates_confirmation_of :password
  
  
  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user
      password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
      if password_hash == user.password_hash
        return user
      end
    end
    
    return nil
  end
  
  
  private
  
  def encrypt_password()
    if self.password.present?
      salt = BCrypt::Engine.generate_salt
      self.password_salt = salt
      self.password_hash = BCrypt::Engine.hash_secret(self.password, salt)
    end
  end
end
