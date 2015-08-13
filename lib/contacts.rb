class Contact
  attr_reader(:first_name, :last_name, :job_title, :company)

  @@all_contacts = []


  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@all_contacts.length().+(1)

    @tele_numbers = []
    @mailing_addresses =[]
    @emailing_addresses = []
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id().eql?(id.to_i())
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:tele_numbers) do
    @tele_numbers
  end

  define_method(:mailing_addresses) do
    @mailing_addresses
  end

  define_method(:emailing_addresses) do
    @emailing_addresses
  end

  define_method(:add_mailing_address) do |mailing_address|
    @mailing_addresses.push(mailing_address)
  end

  define_method(:add_phone_number) do |phone_number|
    @tele_numbers.push(phone_number)
  end

  define_method(:add_emailing_address) do |emailing_address|
    @emailing_addresses.push(emailing_address)
  end
end
