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

require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "Factory bot creates" do
    student = FactoryBot.build(:student)
    expect(student).to be_valid
  end

  it { should have_many :exams_students }
  it { should have_many(:exams).through(:exams_students)}

end
