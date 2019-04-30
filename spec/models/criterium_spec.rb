# == Schema Information
#
# Table name: criteria
#
#  id                   :bigint(8)        not null, primary key
#  criteria_critical    :boolean
#  criteria_description :text
#  number               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  station_id           :integer
#

require 'rails_helper'

RSpec.describe Criterium, type: :model do

  it "Factory bot requires station to exist" do
    criteria = FactoryBot.build(:criterium)
    expect(criteria).to_not be_valid
  end

  it { should belong_to :station }
  it { should have_many :criteria_results }

end
