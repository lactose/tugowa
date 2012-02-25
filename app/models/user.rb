class User < ActiveRecord::Base
  has_many :sheets
  validates_associated :sheets 
  validates :email, :presence => true, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "The e-mail address is invalid." }
  # uncomment this line when the form has a tos
  # validates :terms_of_service, :acceptance => true
end
