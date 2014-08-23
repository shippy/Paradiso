class RequestsController < ApplicationController

  def new
    @request = Request.new
    @sections = Section.all
  end

  def create
   # @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:student_id, :original_section_id, :target_section_id)
    end
end
