class Pair < ActiveRecord::Base
  belongs_to :sheet
  validates :question, :presence => true
  validates :answer, :presence => true
  validates :sheet_id, :presence => true
end
