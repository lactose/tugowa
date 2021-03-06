require 'digest'
require 'securerandom'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :sheets
  has_one :team
  validates_associated :sheets 
  validates :email, :presence => true, 
                    :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "The e-mail address is invalid." },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 },
                       :on           => :update
  # uncomment this line when the form has a tos
  # validates :terms_of_service, :acceptance => true
  before_save :encrypt_password, :generate_code #if password_required?
  after_create :registration_notification
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def self.confirm(email, submitted_code)
    user = find_by_email(email)
    if user.confirm_code == submitted_code && !user.nil?
      #user.confirmed = true
      #user.save(:validate => false)
      return user
    else
      return nil
    end
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

    def generate_code
      self.confirm_code = SecureRandom.hex(13)
    end
    
    def registration_notification
      UserMailer.registration_confirmation(self).deliver
    end

    

end
