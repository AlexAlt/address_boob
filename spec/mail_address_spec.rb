require('rspec')
require('mail_address')

describe(MailAddress) do

  before() do
    MailAddress.clear()
  end

  describe('#street_number') do
    it('returns the street number for the mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.street_number()).to(eq("1"))
    end
  end

  describe('#street_name') do
    it('returns the street name for the mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.street_name()).to(eq("Infinite Loop"))
    end
  end

  describe('#city') do
    it('returns the city of the mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.city()).to(eq("Cupertino"))
    end
  end

  describe('#state') do
    it('returns the state for the mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.state()).to(eq("CA"))
    end
  end

  describe('#zip') do
    it('returns the zip code for the mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.zip()).to(eq("95014"))
    end
  end

  describe('#type') do
    it('returns the type of mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      expect(test_mail_address.type()).to(eq("work"))
    end
  end
  
  describe('.all') do
    it('initially returns an empty array') do
      expect(MailAddress.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a mail address in the mail addresss array') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      test_mail_address.save()
      expect(MailAddress.all()).to(eq([test_mail_address]))
    end
  end

  describe('.clear') do
    it('clears the array of mail addresss') do
      MailAddress.clear()
      expect(MailAddress.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of an mail address') do
      test_mail_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      test_mail_address.save()
      expect(test_mail_address.id()).to(eq(1))
    end
  end
end
