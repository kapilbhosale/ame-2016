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

# college_name,college_code,branch_name,branch_code,category_name,rank,composite_score

class CutOff < ActiveRecord::Base
end
