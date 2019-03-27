# == Schema Information
#
# Table name: uni_modules
#
#  module_code :string           not null, primary key
#  module_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UniModule < ApplicationRecord
  has_and_belongs_to_many :students
end
