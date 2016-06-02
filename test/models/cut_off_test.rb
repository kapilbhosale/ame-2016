# == Schema Information
#
# Table name: cut_offs
#
#  id              :integer          not null, primary key
#  college_name    :string           not null
#  college_code    :integer          not null
#  branch_name     :string           not null
#  branch_code     :integer          not null
#  category_name   :string           not null
#  rank            :integer          not null
#  composite_score :decimal(17, 2)   not null
#

require 'test_helper'

class CutOffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
