# == Schema Information
#
# Table name: answers
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  station_id :integer
#

class Answer < ApplicationRecord
    belongs_to :station, :foreign_key=>:station_id
end
