# == Schema Information
#
# Table name: students
#
#  forename   :string
#  regno      :integer
#  surname    :string
#  username   :string           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :student do
    student_id { "MyString" }
    forename { "MyString" }
    surname { "MyString" }
    regno { 1 }
  end
end
