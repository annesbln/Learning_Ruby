class Email
  def initialize( subject, headers )
    @subject = subject
    @headers = headers
  end

  def subject
    @subject
  end

  def date
    @headers[:date]
  end

  def from
    @headers[:from]
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def emails
    @emails
  end

end

class MailboxTextFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end

  

end

emails = [
  Email.new("Homework this week", { date: "2014-12-01", from: "Ferdous" }),
  Email.new("Keep on coding! :)", { date: "2014-12-01", from: "Dajana" }),
  Email.new("Re: Homework this week", { date: "2014-12-02", from: "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end