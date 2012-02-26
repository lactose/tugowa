class Sheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :pairs
  validates :name, :presence => true, :topic_id, :presence => true, :user_id, :presence => true
  validates_associated :pairs
end
