# == Schema Information
#
# Table name: uni_modules
#
#  id          :bigint(8)        not null, primary key
#  module_code :string
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
