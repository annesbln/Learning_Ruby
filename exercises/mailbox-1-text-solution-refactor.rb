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
    data = @mailbox.emails.collect do |email|
      [email.date, email.from, email.subject]
    end

    data.unshift(["Date", "From", "Subject"])

    widths = data.transpose.collect do |column|
      column.max_by(&:length).length
    end

    border = (0..(widths.length - 1)).map do |index|
      "-" * (widths[index] + 2)
    end
    border = "+" + border.join("+") + "+"
    
    lines = data.map do |row|
      row = row.map.with_index do |cell, index|
        cell.ljust(widths[index])
      end
      "| " + row.join(" | ") + " |"
    end

    lines.push(border)
    lines.insert(1, border)
    lines.unshift(border)

    puts lines
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