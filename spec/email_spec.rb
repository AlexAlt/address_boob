require('rspec')
require('email')

describe(Email) do

  before() do
    Email.clear()
  end

  describe('#address') do
    it('returns the address for the email') do
      test_email = Email.new(:address => "help@help.com", :type => "personal")
      expect(test_email.address()).to(eq("help@help.com"))
    end
  end


  describe('#type') do
    it('returns the type of email') do
      test_email = Email.new(:address => "help@help.com", :type => "personal")
      expect(test_email.type()).to(eq("personal"))
    end
  end

  describe('.all') do
    it('initially returns an empty array') do
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a email in the emails array') do
      test_email = Email.new(:address => "help@help.com", :type => "personal")
      test_email.save()
      expect(Email.all()).to(eq([test_email]))
    end
  end

  describe('.clear') do
    it('clears the array of emails') do
      Email.clear()
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of an email') do
      test_email = Email.new(:address => "help@help.com", :type => "personal")
      test_email.save()
      expect(test_email.id()).to(eq(1))
    end
  end
end
