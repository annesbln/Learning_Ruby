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
    dates = []
    authors = []
    subjects = []

    @mailbox.emails.collect do |email|
      dates.push(email.date)
    end

    @mailbox.emails.collect do |email|
      authors.push(email.from)
    end

    @mailbox.emails.collect do |email|
      subjects.push(email.subject)
    end

    maxDates = dates.max_by { |date| date.length }
    maxDates = maxDates.length

    maxAuthors = authors.max_by { |author| author.length }
    maxAuthors = maxAuthors.length

    maxSubjects = subjects.max_by { |subject| subject.length }
    maxSubjects = maxSubjects.length

    border = "+-" + "-" * maxDates + "-+" + "+-" + "-" * maxAuthors + "-+" + "+-" + "-" * maxSubjects + "-+" 

    column1 = dates.collect do |date|
      "| " + date.ljust(maxDates) + " |"
    end

    column2 = authors.collect do |author|
      "| " + author.ljust(maxAuthors) + " |"
    end

    column3 = subjects.collect do |subject|
      "| " + subject.ljust(maxSubjects) + " |"
    end

    lines = column1 + column2 + column3

    lines.unshift(border)
    lines.push(border)

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

p formatter.format