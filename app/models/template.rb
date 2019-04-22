# == Schema Information
#
# Table name: templates
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Template < ApplicationRecord
    has_many :stations, inverse_of: :template
end
