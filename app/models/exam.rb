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

class Exam < ApplicationRecord

  belongs_to :uni_module, :foreign_key=>:module_code

  scope :undeployed, -> { where(status: 0).order(:date) }
  scope :deployed, -> { where(status: 1).order(:date) }
  scope :completed, -> { where(status: 2).order(:date) }
  scope :archive, -> { where(status: 3).order(:date) }
  scope :templates, -> { where(status: 4).order(:date) }
  
end
