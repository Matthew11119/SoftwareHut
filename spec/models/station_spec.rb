# == Schema Information
#
# Table name: stations
#
#  id           :bigint(8)        not null, primary key
#  pass_mark    :integer
#  station_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exam_id      :string
#  template_id  :integer
#

require 'rails_helper'

RSpec.describe Station, type: :model do

  it "doesn't create without exam" do
    station = FactoryBot.build(:station)
    expect(station).to_not be_valid
  end

  it { should belong_to :exam }
  it { should have_many :answers }
  it { should have_many :criteria }
end
