# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  first_name        :string           not null
#  father_name       :string
#  surname           :string           not null
#  mother_name       :string           not null
#  date_of_birth     :datetime         not null
#  rank              :integer          not null
#  composite_score   :decimal(, )      not null
#  category          :string           not null
#  home_university   :string
#  contact_no        :string
#  father_contact_no :string
#  email             :string
#  address           :text
#  cet_exam_number   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  gender            :integer          default("0"), not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
