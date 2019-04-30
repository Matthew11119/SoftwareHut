# == Schema Information
#
# Table name: exams
#
#  date        :date
#  exam_code   :string           not null, primary key
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Exam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    exam = FactoryBot.build(:exam)
    expect(exam).to be_valid
  end

  it { should have_many :exams_students }
  it { should have_many(:students).through(:exams_students) }
  it { should have_many :stations }

  describe "#student_import" do
    #it "adds student if it doesn't exist" do
    #  let(:header) {}
    #end
  end
end
