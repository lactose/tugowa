class Pair < ActiveRecord::Base
  belongs_to :sheet
  validates :question, :presence => true, :answer, :presence => true, :sheet_id, :presence => true
end
