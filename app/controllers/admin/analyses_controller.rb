class Admin::AnalysesController < ApplicationController
  def new
    @student = Student.find_by(id: params[:student_id])
    if @student.blank?
      flash[:alert] = "Please select valid student"
    else
      @branches = CutOff.select(:branch_name).uniq.order(:branch_name)
      @regions = ['Amravati', 'Aurangabad', 'Mumbai', 'Nagpur', 'Nashik', 'Pune']
    end
  end

  def perform_analysis
    @preferences = []
    student = Student.find_by(id: params[:student_id])

    selected_regions = params[:region].map(&:downcase) if params[:region].present?
    selected_college_codes = RegionCollege.where(region_name: selected_regions).pluck(:college_code)

    if selected_college_codes.present?
      raw_preferences = CutOff.where(college_code: selected_college_codes)
    end

    selected_branches =  params[:branch]
    if selected_branches.present?
      raw_preferences = raw_preferences.where(branch_name: selected_branches)
    end

    raw_preferences = CutOff.all if raw_preferences.blank?

    category = student.profile.category
    rank = student.profile.rank

    available_categories = []

    unless ['PHC','DEF'].include?(category)
      category = student.profile.gender == 0 ? "G" + category : "L" + category
    end


    available_categories << category + "H"
    available_categories << category + "O"

    raw_preferences = raw_preferences.where(category_name: available_categories)

    if raw_preferences.count > 50
      greater_options = params[:greater_options].present? ? params[:greater_options].to_i : 40
      lesser_options = params[:lesser_options].present? ? params[:lesser_options].to_i : 60

      @preferences << raw_preferences.where("rank < ?", rank).order("rank").last(greater_options)
      @preferences << raw_preferences.where("rank > ?", rank).order("rank").first(lesser_options)
    else
      @preferences << raw_preferences
    end
    @preferences.flatten!

  end
end
