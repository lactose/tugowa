class Sheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :pairs
  validates_associated :pairs
end
