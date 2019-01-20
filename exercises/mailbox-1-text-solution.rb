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
    dates = @mailbox.emails.collect do |email|
      email.date
    end

    authors = @mailbox.emails.collect do |email|
      email.from
    end

    subjects = @mailbox.emails.collect do |email|
      email.subject
    end

    maxDates = getMaxLength(dates)
    maxAuthors = getMaxLength(authors)
    maxSubjects = getMaxLength(subjects)

    # Use an array for WIDTHs!
    dateTitle = "Date"
    authorsTitle = "From"
    subjectsTitle = "Subject"

    titleLengthDates = dateTitle.length # remove those!
    titleLengthAuthors = authorsTitle.length
    titleLengthSubjects = subjectsTitle.length

    border = "+-" + "-" * maxDates + "-+-" + "-" * maxAuthors + "-+-" + "-" * maxSubjects + "-+"
    header = "| " + dateTitle + " " * (maxDates-titleLengthDates) + " | " + authorsTitle + " " * (maxAuthors-titleLengthAuthors) + " | " + subjectsTitle + " " * (maxSubjects-titleLengthSubjects) + " |"

    lines = [
      border,
      header,
      border,
      # 0.upto(dates.length) do |index| ... end
      # use ljust!
      "| " + dates[0] + " " * (maxDates-dates[0].length) + " | " + authors[0] + " " * (maxAuthors-authors[0].length) + " | " + subjects[0] + " " * (maxSubjects-subjects[0].length) + " |",
      "| " + dates[1] + " " * (maxDates-dates[1].length) + " | " + authors[1] + " " * (maxAuthors-authors[1].length) + " | " + subjects[1] + " " * (maxSubjects-subjects[1].length) + " |",
      "| " + dates[2] + " " * (maxDates-dates[2].length) + " | " + authors[2] + " " * (maxAuthors-authors[2].length) + " | " + subjects[2] + " " * (maxSubjects-subjects[2].length) + " |",
      border
    ]
    # data = [dates, authors, subjects].transpose
    # lines = data.collect |row| ...
  end
  # Helper method should be outside the main method! Don't nest methods!
  
  private
  
    def getMaxLength(inputs)
      inputs.max_by { |input| input.length }.length
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