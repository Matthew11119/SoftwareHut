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

class User < ApplicationRecord
  include EpiCas::DeviseHelper

  scope :admins,       -> { where(user_type: "Admin") }
  scope :module_leads, -> { where(user_type: "Module Lead") }
  scope :moderators,    -> { where(user_type: "Moderator") }

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  end
