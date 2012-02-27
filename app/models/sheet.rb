class Sheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :pairs
  validates :name, :presence => true
  validates :topic_id, :presence => true
  validates :user_id, :presence => true
  validates_associated :pairs
end
