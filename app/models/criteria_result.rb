# == Schema Information
#
# Table name: criteria_results
#
#  id            :bigint(8)        not null, primary key
#  answer        :integer
#  criteria_mark :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#

class CriteriaResult < ApplicationRecord
  belongs_to :station_result
  before_validation :calculate_crit_mark

  private
    def calculate_crit_mark
      puts "RUNNING CALCULATE"
      puts answer_before_type_cast
      if answer_before_type_cast == "Fully Met"
        self.criteria_mark = 2
        self.answer = 0
      elsif answer_before_type_cast == "Partially Met"
        self.criteria_mark = 1
        self.answer = 1
      else
        self.criteria_mark = 0
        self.answer = 2
      end
      puts self.criteria_mark
    end
end
