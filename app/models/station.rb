# == Schema Information
#
# Table name: stations
#
#  id           :bigint(8)        not null, primary key
#  exam_code    :string
#  pass_mark    :integer
#  station_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Station < ApplicationRecord
  belongs_to :exam, :foreign_key=>:exam_code
end
