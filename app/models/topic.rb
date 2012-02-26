class Topic < ActiveRecord::Base
  has_many :sheets
  validates :name, :presence => true
end
