class Admin::StudentsController < Admin::BaseController

  def show
    query_string = params[:search_string]
    if query_string.present?
      student_ids = []
      student_ids += Profile.where("first_name ILIKE ?", "%#{query_string}%").pluck(:user_id)
      student_ids += Profile.where("surname ILIKE ?", "%#{query_string}%").pluck(:user_id)

      @students = Student.where(created_by: current_admin.id).where(id: student_ids).includes(:profile)
    else
      @students = Student.where(created_by: current_admin.id).includes(:profile)
    end

  end

  def new
    @categories = [['OPEN','OPEN'], ['SC','SC'], ['ST','ST'], ['VJ','VJ'], ['NT1','NT1'], ['NT2','NT2'],
                   ['NT3','NT3'], ['OBC','OBC'], ['PHC','PHC'], ['DEF','DEF']]
  end

  def create
    student_email = params[:email]
    student_contact_no =  params[:contact_no]
    if student_email.present?
      # create student
      student = Student.new
      student.email = student_email
      generated_password = student_contact_no.length >= 8 ? student_contact_no : '1234567890'
      student.password =  generated_password
      student.created_by = current_admin.id
      student.save

      if student.errors.present?
        flash[:alert] = student.errors.full_messages.join(', ')
        redirect_to :back and return
      end

      student_profile = student.create_profile(student_params)
      # create student profile
      unless student_profile.errors.present?
        flash[:notice] = "student added successfully."
        redirect_to admin_root_path and return
      else
        flash[:alert] = student_profile.errors.full_messages.join(', ')
        redirect_to :back and return
      end
    else
      flash[:alert] = "please enter valid email"
      redirect_to :back and return
    end
  end

    private
    def student_params
      {
        first_name: params[:first_name],
        father_name: params[:father_name],
        surname: params[:surname],
        mother_name: params[:mother_name],
        gender: (params[:gender] == 'male' ? 0 : 1),
        date_of_birth: params[:date_of_birth],
        rank: params[:rank],
        composite_score: params[:composite_score],
        category: params[:category],
        contact_no: params[:contact_no],
        father_contact_no: params[:father_contact_no],
        email: params[:email],
        address: params[:address],
        cet_exam_number: params[:cet_exam_number]
      }
    end
end

