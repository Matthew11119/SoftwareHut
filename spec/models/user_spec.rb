# == Schema Information
#
# Table name: users
#
#  current_sign_in_at :datetime
#  current_sign_in_ip :inet
#  dn                 :string
#  email              :string           default(""), not null
#  givenname          :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :inet
#  mail               :string
#  ou                 :string
#  sign_in_count      :integer          default(0), not null
#  sn                 :string
#  uid                :string
#  user_type          :string
#  username           :string           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    FactoryBot.build(:user).should be_valid
  end



end
