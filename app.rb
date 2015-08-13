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
  erb(:contact)
end

get('/contact/:id/phone_form') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_form)
end

post('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @tele_numbers = @contact.tele_numbers()
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  type = params.fetch('type')
  new_number = PhoneNumber.new(:area_code => area_code, :number => number, :type => type)
  new_number.save()
  @contact.add_phone_number(new_number)
  erb(:contact)
end
