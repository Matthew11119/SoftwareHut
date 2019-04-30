# == Schema Information
#
# Table name: answers
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  station_id :integer
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "doesn't create without station" do
    answer = Answer.new
    expect(answer).to_not be_valid
  end

  it { should belong_to :station }


end
