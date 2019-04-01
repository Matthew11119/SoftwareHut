# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  forename   :string
#  regno      :integer
#  surname    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :string
#

class Student < ApplicationRecord
  has_and_belongs_to_many :uni_modules

end
