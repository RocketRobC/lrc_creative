class ContactFormsController < ApplicationController
  before_action :set_contact_form, only: [:show]


  def show
    redirect_to root_path, notice: "Your enquiry as been sent!"
  end

  # POST /contact_forms
  # POST /contact_forms.json
  def create
    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.save
        ContactFormMailer.enquiry_response(@contact_form.id).deliver_now
        ContactFormMailer.enquiry_received(@contact_form.id).deliver_now
        format.html { redirect_to root_path, notice: "Your enquiry as been sent!" }
        format.json { render :show, status: :created, location: @contact_form }
      else
        format.html { render :new }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_form
      @contact_form = ContactForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_form_params
      params.require(:contact_form).permit(:first_name, :last_name, :business_name, :email, :phone, :details)
    end
end
