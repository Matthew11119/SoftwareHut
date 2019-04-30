# == Schema Information
#
# Table name: uni_modules
#
#  module_code :string           not null, primary key
#  module_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe UniModule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates with FactoryBot" do
    uni_module = FactoryBot.build(:uni_module)
    expect(uni_module).to be_valid
  end
end
