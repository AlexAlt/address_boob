require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/email')
require('./lib/mail_address')
require('./lib/phone_numbers')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/new_contact') do
  @all_contacts = Contact.all()
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job = params.fetch('job')
  company = params.fetch('company')
  new_contact = Contact.new(:first_name =>first_name, :last_name => last_name, :job_title => job, :company => company)
  new_contact.save()
  erb(:all_contacts)
end

get('/all_contacts') do
  @all_contacts = Contact.all()
  erb(:all_contacts)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @tele_numbers = @contact.tele_numbers()
  @emailing_addresses = @contact.emailing_addresses()
  @mailing_addresses = @contact.mailing_addresses()
  erb(:contact)
end

get('/contact/:id/phones/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_form)
end

post('/phones') do
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  type = params.fetch('type')
  new_number = PhoneNumber.new(:area_code => area_code, :number => number, :type => type)
  new_number.save()
  id = params.fetch('id')
  @contact = Contact.find(id.to_i())
  @contact.add_phone_number(new_number)
  redirect("/contact/#{id}")
end

get('/contact/:id/emails/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:email_form)
end

post('/emails') do
  address = params.fetch('address')
  type = params.fetch('type')
  id = params.fetch('id')
  new_email = Email.new(:address => address, :type=> type)
  new_email.save()
  @contact = Contact.find(id.to_i())
  @contact.add_emailing_address(new_email)
  redirect("/contact/#{id}")
end

get('/contact/:id/mail/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:mail_form)
end

post('/mail') do
  street_number = params.fetch('street_number')
  street_name = params.fetch('street_name')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  type = params.fetch('type')
  id = params.fetch('id')
  new_mail_address = MailAddress.new(:street_number => street_number, :street_name => street_name, :city => city, :state => state, :zip => zip, :type => type)
  new_mail_address.save()
  @contact = Contact.find(id.to_i())
  @contact.add_mailing_address(new_mail_address)
  redirect("/contact/#{id}")

end
