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

    def getMaxLength(inputs)
      maxDates = inputs.max_by { |input| input.length }
      maxDates = maxDates.length
      maxDates
    end

    maxDates = getMaxLength(dates)
    maxAuthors = getMaxLength(authors)
    maxSubjects = getMaxLength(subjects)

    dateTitle = "Date"
    authorsTitle = "From"
    subjectsTitle = "Subject"

    titleLengthDates = dateTitle.length
    titleLengthAuthors = authorsTitle.length
    titleLengthSubjects = subjectsTitle.length

    border = "+-" + "-" * maxDates + "-+-" + "-" * maxAuthors + "-+-" + "-" * maxSubjects + "-+"
    header = "| " + dateTitle + " " * (maxDates-titleLengthDates) + " | " + authorsTitle + " " * (maxAuthors-titleLengthAuthors) + " | " + subjectsTitle + " " * (maxSubjects-titleLengthSubjects) + " |"

    lines = [
      border,
      header,
      border,
      "| " + dates[0] + " " * (maxDates-dates[0].length) + " | " + authors[0] + " " * (maxAuthors-authors[0].length) + " | " + subjects[0] + " " * (maxSubjects-subjects[0].length) + " |",
      "| " + dates[1] + " " * (maxDates-dates[1].length) + " | " + authors[1] + " " * (maxAuthors-authors[1].length) + " | " + subjects[1] + " " * (maxSubjects-subjects[1].length) + " |",
      "| " + dates[2] + " " * (maxDates-dates[2].length) + " | " + authors[2] + " " * (maxAuthors-authors[2].length) + " | " + subjects[2] + " " * (maxSubjects-subjects[2].length) + " |",
      border
    ]
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