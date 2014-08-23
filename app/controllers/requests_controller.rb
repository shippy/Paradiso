class RequestsController < ApplicationController

  def index
    @pending_requests = Request.where('active = true')
    @fulfilled_requests = Request.where('active = false')
  end

  def new
    @request = Request.new
    @sections = Section.all
  end

  def create
    targets = params[:request][:targets]
    email = params[:request][:email]
    original = params[:request][:original_section]

    if Student.find_by_netid(session[:cas_user])
      # student exists already
      student = Student.find_by_netid(session[:cas_user])
    else
      student = Student.new(netid: session[:cas_user], email: email)
      student.save
    end

    targets.each do |t, val|
      req = Request.new(original_section_id: original, target_section_id: t, student_id: student.id, active: true)
      req.save
    end
    render :done

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:student_id, :original_section_id, :target_section_id)
    end
end
