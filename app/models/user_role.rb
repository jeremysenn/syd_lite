class UserRole < ActiveRecord::Base
  self.primary_key = 'user_role_index'
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.authenticate(login, pass)
    user = find_by_user_name(login)
#    return user if user && user.is_active? && user.password_hash == user.encrypt_password(pass)
#    return user if user && user.password_hash == user.encrypt_password(pass)
    return user if user && user.password == user.encrypt_password(pass)
  end
  
  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
  
end