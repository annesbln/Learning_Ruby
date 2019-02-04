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

  def format
    data = [ ["Date", "From", "Subject"] ]
    
    @mailbox.emails.collect do |email|
        data << [ email.date, email.from, email.subject ]
    end

    data = data.transpose

    widths = data.collect do |array|
        array.max_by(&:length).length
    end
    #data.transpose.collect is better
    #first index by .collect
    # then the second index
    # adjusting strings first and then join
    #border: create the strings first
    border = "+-" + "-" * widths[0] + "-+-" + "-" * widths[1] + "-+-" + "-" * widths[2] + "-+"
    header = "| " + data[0][0].ljust(widths[0]) + " | " + data[1][0].ljust(widths[1]) + " | " + data[2][0].ljust(widths[2]) + " |"
    rows = [ ("| " + data[0][1].ljust(widths[0]) + " | " + data[1][1].ljust(widths[1]) + " | " + data[2][1].ljust(widths[2]) + " |" ),
            ( "| " + data[0][2].ljust(widths[0]) + " | " + data[1][2].ljust(widths[1]) + " | " + data[2][2].ljust(widths[2]) + " |" ),
            ( "| " + data[0][3].ljust(widths[0]) + " | " + data[1][3].ljust(widths[1]) + " | " + data[2][3].ljust(widths[2]) + " |")]

    lines = [
      border,
      header,
      border,
      rows,
      border
    ]
  end
end

emails = [
  Email.new("Homework this week", { date: "2014-12-01", from: "Ferdous" }),
  Email.new("Keep on coding! :)", { date: "2014-12-04", from: "Dajana" }),
  Email.new("Re: Homework this week", { date: "2014-12-02", from: "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format