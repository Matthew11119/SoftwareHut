# == Schema Information
#
# Table name: exams
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  exam_code   :string
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :exam do
    exam_code { "" }
    exam_date { "" }
    exam_name { "" }
    module_code { "" }
  end
end
