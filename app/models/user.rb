class User < ActiveRecord::Base
  validates :email, :presence => true, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "The e-mail address is invalid." }
end
