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
<<<<<<< HEAD
  belongs_to :exam, :foreign_key=>:exam_code
=======
  belongs_to :exams, optional: true
>>>>>>> 72bf0f198559e571e0ac5cc9c0d3d3075803d59c
end
