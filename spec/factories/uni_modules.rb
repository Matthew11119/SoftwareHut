# == Schema Information
#
# Table name: uni_modules
#
#  module_code :string           not null, primary key
#  module_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :uni_module do
    module_code { "MyString" }
    module_name { "MyString" }
  end
end
