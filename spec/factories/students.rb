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

FactoryBot.define do
  factory :student do
    student_id { "MyString" }
    forename { "MyString" }
    surname { "MyString" }
    regno { 1 }
  end
end
