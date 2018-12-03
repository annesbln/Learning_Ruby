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

email = Email.new("Homework this week", { date: "2014-12-01", from: "Ferdous" })

p email

puts "Date: #{email.date}"
puts "from: #{email.from}"
puts "Subject: #{email.subject}"