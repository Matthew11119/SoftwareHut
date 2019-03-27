# == Schema Information
#
# Table name: students
#
#  forename   :string
#  regno      :integer          not null, primary key
#  surname    :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
