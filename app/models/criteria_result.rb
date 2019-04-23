# == Schema Information
#
# Table name: criteria_results
#
#  id                :bigint(8)        not null, primary key
#  answer            :integer
#  criteria_mark     :integer
#  feedback          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  station_result_id :bigint(8)
#
# Indexes
#
#  index_criteria_results_on_station_result_id  (station_result_id)
#
# Foreign Keys
#
#  fk_rails_...  (station_result_id => station_results.id)
#

class CriteriaResult < ApplicationRecord
  belongs_to :station_result
  before_validation :calculate_crit_mark

  private
    def calculate_crit_mark
      #puts answer_before_type_cast
      #query = CriteriaResult.select('answers.score').joins(:stations, :answers).where('answer.text = "Fully Met"')
      #puts query
      #@answer = Answer.select('score').where(text: 'Fully Met').first
      #puts "First answer is "
      #print @answer.inspect
      #if @answer.first.to_i == 2
    #    puts "YESSSSS"
      #else
      #  puts "There was something wrong"
      #end

      #CriteriaResult.joins(station_result: [station: :answers]).where(answers: {text: 'Fully Met'})
      if criteria_mark == 1
        if answer_before_type_cast == "Not Met"
          self.criteria_mark = -1000
        else
          self.criteria_mark = 2
        end
      else
        newAnswer = Answer.select("score").where("text = ?", answer_before_type_cast).first
        puts newAnswer.inspect
        puts answer_before_type_cast
        self.criteria_mark = newAnswer.score
        if answer_before_type_cast == "Fully met"
          self.answer = 0
        elsif answer_before_type_cast == "Partially met"
          self.answer = 1
        else
          self.answer = 2
        end
      end
    end

end
