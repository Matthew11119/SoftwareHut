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

class UniModule < ApplicationRecord
  has_and_belongs_to_many :students
end
