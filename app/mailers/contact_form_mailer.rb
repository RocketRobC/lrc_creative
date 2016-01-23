class ContactFormMailer < ApplicationMailer

  def enquiry_response(contact_form_id)
    @contact_form = ContactForm.find(contact_form_id)
    mail(to: @contact_form.email, subject: "Thanks #{@contact_form.first_name} for contacting LRC Creative")
  end

  def enquiry_received(contact_form_id)
    @contact_form = ContactForm.find(contact_form_id)
    mail(to: ["robcornish@gmail.com", "lucycornish81@gmail.com"], subject: "Enquiry Received form #{@contact_form.email}")
  end

end
