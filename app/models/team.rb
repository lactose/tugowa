class Team < ActiveRecord::Base
  validates :name, :presence => true, :message => "Team must have a name."
end
