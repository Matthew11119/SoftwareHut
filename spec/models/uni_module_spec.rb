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

require 'rails_helper'

RSpec.describe UniModule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
