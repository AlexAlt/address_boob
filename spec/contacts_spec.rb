require('rspec')
require('contacts')

describe(Contact) do
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
end
