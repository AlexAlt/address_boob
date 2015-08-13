require('rspec')
require('contacts')

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
end
