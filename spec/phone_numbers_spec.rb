require('rspec')
require('phone_numbers')

describe(PhoneNumber) do

  describe('#area_code') do
    it('returns the area code for the phone number') do
      test_number = PhoneNumber.new(:area_code =>"860", :number => "123-4567", :type => "cell")
      expect(test_number.area_code()).to(eq("860"))
    end
  end

  describe('#number') do
    it('returns the number for the phone number') do
      test_number = PhoneNumber.new(:area_code =>"860", :number => "123-4567", :type => "cell")
      expect(test_number.number()).to(eq("123-4567"))
    end
  end

  describe('#type') do
    it('returns the type of phone number') do
      test_number = PhoneNumber.new(:area_code =>"860", :number => "123-4567", :type => "cell")
      expect(test_number.type()).to(eq("cell"))
    end
  end

  describe('.all') do
    it('initially returns an empty array') do
      expect(PhoneNumber.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a phone number in the phone numbers array') do
      test_number = PhoneNumber.new(:area_code =>"860", :number => "123-4567", :type => "cell")
      test_number.save()
      expect(PhoneNumber.all()).to(eq([test_number]))
    end
  end
end
