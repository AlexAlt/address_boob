require('rspec')
require('contacts')
require('phone_numbers')

describe(Contact) do
  before() do
    Contact.clear
  end

  describe('#first_name') do
    it('returns the first name of the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.first_name()).to(eq("Alex"))
    end
  end

  describe('#last_name') do
    it('returns the last name of the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.last_name()).to(eq("Altieri"))
    end
  end

  describe('#job_title') do
    it('returns the job title of the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.job_title()).to(eq("Human"))
    end
  end

  describe('#company') do
    it('returns the company of the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.company()).to(eq("Universe"))
    end
  end

  describe('.all') do
    it('initially returns an empty array') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a contact to an array of contacts') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it('clears the array of contacts') do
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the ID of the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".find") do
    it('finds a specific contact using its id') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      test_contact2 = Contact.new(:first_name =>"Leah", :last_name => "Klamkin", :job_title => "Alien", :company => "Alpha Centauri")
      test_contact2.save()
      expect(Contact.find(1)).to(eq(test_contact))
    end
  end

  describe('#tele_numbers') do
    it('returns an array of phone numbers for that contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.tele_numbers()).to(eq([]))
    end
  end

  describe('#add_phone_number') do
    it('adds a phone number to the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      test_phone_number = PhoneNumber.new(:area_code =>"860", :number => "123-4567", :type => "cell")
      test_contact.add_phone_number(test_phone_number)
      expect(test_contact.tele_numbers()).to(eq([test_phone_number]))
    end
  end

  describe('#mailing_addresses') do
    it('returns an array of mailing addresses for that contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.mailing_addresses()).to(eq([]))
    end
  end

  describe('#add_mailing_address') do
    it('adds a mailing address to the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      test_mailing_address = MailAddress.new(:street_number => "1", :street_name => "Infinite Loop", :city => "Cupertino", :state => "CA", :zip => "95014", :type => "work")
      test_contact.add_mailing_address(test_mailing_address)
      expect(test_contact.mailing_addresses()).to(eq([test_mailing_address]))
    end
  end

  describe('#emailing_addresses') do
    it('returns an array of emailing addresses for that contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      expect(test_contact.emailing_addresses()).to(eq([]))
    end
  end

  describe('#add_emailing_address') do
    it('adds a mailing address to the contact') do
      test_contact = Contact.new(:first_name =>"Alex", :last_name => "Altieri", :job_title => "Human", :company => "Universe")
      test_contact.save()
      test_emailing_address = Email.new(:address => "help@help.com", :type => "personal")
      test_contact.add_emailing_address(test_emailing_address)
      expect(test_contact.emailing_addresses()).to(eq([test_emailing_address]))
    end
  end


end
