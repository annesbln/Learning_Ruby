require "csv"

class Email
  def initialize(subject, headers)
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

class MailboxHtmlFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format
    tag(:html, [head, body].join("\n"))
  end

  def body
    tag(:body, [headline, table].join("\n"))
  end

  def headline
    tag(:h1, @mailbox.name)
  end

  def table
    tag(:table, [thead, tbody].join("\n"))
  end

  def thead
    tag(:thead, ths.join("\n"))
  end

  def ths
    headers = ["Date", "From", "Subject"]
    headers.map { |content| tag(:th, content) }
  end

  def tbody
    tag(:tbody, trs.join("\n"))
  end

  def trs
    rows.map { |row| tr(row) }
  end

  def tr(row)
    tag(:tr, tds(row).join("\n"))
  end

  def tds(row)
    row.collect { |content| tag(:td, content) }
  end

  def tag(name, content)
    content = "\n#{content}\n" unless [:h1, :td, :th].include?(name)
    html = "<#{name}>#{content}</#{name}>"
    html = indent(html) unless name == :html
    html
  end

  def indent(html)
    lines = html.split("\n")
    lines = lines.map { |line| " " * 2 + line }
    lines.join("\n")
  end

  def rows
    @mailbox.emails.collect do |email|
      [email.date, email.from, email.subject]
    end
  end

  def head
    "<head>
      <style>
        table {
          border-collapse: collapse;
        }
        td, th {
          border: 1px solid black;
          padding: 1em;
        }
      </style>
    </head>"
  end
end

class EmailsCsvStore
  def initialize(filename)
    @filename = filename
  end

  def read
    rows = CSV.read(@filename)  # each line is an array of three strings
    emails(rows)
  end

  def emails(rows)
    rows.shift                  #kicks out the first line as its the header
    rows.map {|row| Email.new(row[2], { date: row[0], from: row[1] })}
  end
end

store = EmailsCsvStore.new("emails.csv")
emails = store.read

mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

File.write("mailbox-csv_file.html", formatter.format)
