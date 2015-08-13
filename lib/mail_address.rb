class MailAddress

  @@all_mail_addresses = []
  attr_reader(:street_number, :street_name, :city, :state, :zip, :type)

  define_method(:initialize) do |attributes|
    @street_number = attributes.fetch(:street_number)
    @street_name = attributes.fetch(:street_name)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = @@all_mail_addresses.length().+(1)
  end

  define_singleton_method(:all) do
    @@all_mail_addresses
  end

  define_method(:save) do
    @@all_mail_addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@all_mail_addresses = []
  end

  define_method(:id) do
    @id
  end
end
