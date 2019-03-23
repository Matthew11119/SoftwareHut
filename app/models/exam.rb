# == Schema Information
#
# Table name: exams
#
#  date        :date
#  exam_code   :string           not null, primary key
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Exam < ApplicationRecord
  belongs_to :uni_module, :foreign_key=>:module_code
  
  has_many :stations, inverse_of: :exam
  accepts_nested_attributes_for :stations

  scope :undeployed, -> { where(status: 0).order(:date) }
  scope :deployed, -> { where(status: 1).order(:date) }
  scope :completed, -> { where(status: 2).order(:date) }
  scope :archive, -> { where(status: 3).order(:date) }
  scope :templates, -> { where(status: 4).order(:date) }
end
