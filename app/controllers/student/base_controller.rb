class Student::BaseController < ApplicationController
  before_action :authenticate_student!
end
