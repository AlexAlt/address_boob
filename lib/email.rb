class Email

  @@all_emails = []
  attr_reader(:address, :type)

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
    @type = attributes.fetch(:type)
    @id = @@all_emails.length().+(1)
  end

  define_singleton_method(:all) do
    @@all_emails
  end

  define_method(:save) do
    @@all_emails.push(self)
  end

  define_singleton_method(:clear) do
    @@all_emails = []
  end

  define_method(:id) do
    @id
  end
end
