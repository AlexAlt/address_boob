class Contact
  attr_reader(:first_name, :last_name, :job_title, :company)

  @@all_contacts = []


  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@all_contacts.length().+(1)
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
end
