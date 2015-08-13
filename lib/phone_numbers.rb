class PhoneNumber

  @@all_phone_numbers = []
  attr_reader(:area_code, :number, :type)

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
  end

  define_singleton_method(:all) do
    @@all_phone_numbers
  end

  define_method(:save) do
    @@all_phone_numbers.push(self)
  end
end
