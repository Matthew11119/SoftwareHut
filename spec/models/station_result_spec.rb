# == Schema Information
#
# Table name: station_results
#
#  id            :bigint(8)        not null, primary key
#  audio         :string
#  examiner_name :string
#  feedback      :string
#  mark          :integer
#  username      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#

require 'rails_helper'

RSpec.describe StationResult, type: :model do

  it "creates with FactoryBot" do
    station_result = FactoryBot.build(:station_result)
    expect(station_result).to be_valid
  end

  it { should belong_to :station }
  it { should have_many :criteria_results }

  describe '.get_remaining_student' do
    it "gives none for a station with no students registered" do
      mock_station = double('station', id: 1, exam_code: 'EX1')
      mock_exam = double('exam', exam_code: 'EX1')
      rem = StationResult.get_remaining_student(mock_station.id.to_s)
      total = 0
      rem.each do |r|
        total += 1
      end
      expect(total).to eq 0
    end
  end

  describe '.get_completed_student' do
    it "gives none for a station with no students registered" do
      mock_station = double('station', id: 1, exam_code: 'EX1')
      mock_exam = double('exam', exam_code: 'EX1')
      rem = StationResult.get_completed_student(mock_station.id.to_s, 'BOB')
      total = 0
      rem.each do |r|
        total += 1
      end
      expect(total).to eq 0
    end
  end

end
