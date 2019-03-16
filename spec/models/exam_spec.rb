# == Schema Information
#
# Table name: exams
#
#  id          :bigint(8)        not null, primary key
#  exam_code   :string
#  exam_date   :date
#  exam_name   :string
#  module_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exam_id     :integer
#

require 'rails_helper'

RSpec.describe Exam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
