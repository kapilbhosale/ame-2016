# == Schema Information
#
# Table name: region_colleges
#
#  id           :integer          not null, primary key
#  region_name  :string
#  college_code :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RegionCollege < ActiveRecord::Base
end
