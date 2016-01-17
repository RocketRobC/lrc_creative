# Preview all emails at http://localhost:3000/rails/mailers/contact_form_mailer
class ContactFormMailerPreview < ActionMailer::Preview

  def enquiry_received
    contact_form = ContactForm.find(5)
    ContactFormMailer.enquiry_received(contact_form)
  end

end
