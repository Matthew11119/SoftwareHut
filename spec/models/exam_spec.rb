# == Schema Information
#
# Table name: exams
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  exam_code   :string
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Exam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
