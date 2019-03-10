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

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

#my own (longer) solution:
# file = File.new("mailbox-html_file-1.html", "w")
# file.puts(formatter.format)
# file.close

#shorter (official) Solution:
File.write("mailbox-html_file-1.html", formatter.format)

# r - Read only. The file must exist.
# w - Create an empty file for writing.
# a - Append to a file.The file is created if it does not exist.
# r+ - Open a file for update both reading and writing. The file must exist.
# w+ - Create an empty file for both reading and writing.
# a+ - Open a file for reading and appending. The file is created if it does not exist.
