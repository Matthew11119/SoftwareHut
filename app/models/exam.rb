# == Schema Information
#
# Table name: exams
#
#  id          :bigint(8)        not null, primary key
#  exam_code   :string
#  exam_date   :date
#  exam_name   :string
#  module_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exam_id     :integer
#

class Exam < ApplicationRecord
  belongs_to :uni_modules, optional: true
end
