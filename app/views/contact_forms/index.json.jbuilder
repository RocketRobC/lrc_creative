json.array!(@contact_forms) do |contact_form|
  json.extract! contact_form, :id, :first_name, :last_name, :business_name, :email, :phone, :details
  json.url contact_form_url(contact_form, format: :json)
end
