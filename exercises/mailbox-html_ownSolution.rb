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
    headTags = ["style", "head"]
    theadTags = ["tr", "thead"]
    bodyTags = ["table", "body"]

    level = headTags.length
    styleString = "table {\n" +
            "       border-collapse: collapse;\n" +
            "     }\n" +
            "     td, th {\n" +
            "       border: 1px solid black;\n" +
            "       padding: 1em;\n" +
            "     }"
    header = fillSection(level, headTags, " " * (level + 1) + "#{styleString}\n")


    level = theadTags.length

    # headlines = Email.new("", {}).methods - Object.methods
    headlines = Email.instance_methods(false)
    headlines = fillTableWithContent(level, headlines, "th")
    theader = fillSection(level, theadTags, " " * level + "#{headlines.join}\n")

    emails = @mailbox.emails #variable names should be precise and much shorter (ideally just one word)
    tableContent = emails.map do |email|
      emailContent = [email.date, email.from, email.subject]
      emailContent = fillTableWithContent(level+2, emailContent, "td")
      emailContent = inputTag(level+1, "tr", emailContent.join)
    end
    tableBody = inputTag(level, "tbody", tableContent.join)
    table = theader + tableBody
    final = header + fillSection(level, bodyTags, " " * level + "#{table}\n")
    inputTag(0, "html", final)
  end

  def inputTag(level, tag_word, content) #call it tag, tag_word is name
    space = " " * level
    "#{space}<#{tag_word}>\n#{content}#{space}</#{tag_word}>\n"
  end
  
  # just call it table
  def fillTableWithContent(level, rows, tag) # not tag better name, rows is okay, its alwayls "Td"
    rows = rows.map do |row|
      if row == rows[0] && tag != "td"
        "<#{tag}>#{row}</#{tag}>\n"
      elsif row == rows[rows.length - 1] && tag != "td"
        " " * level + "<#{tag}>#{row}</#{tag}>"
      else
        " " * level + "<#{tag}>#{row}</#{tag}>\n"
      end
    end
  end

  def fillSection(level, sectionTags, content) # in ruby we use noun for methods --> section
    sectionTags.map do |sectionTag|
      if sectionTag == "body"
        content =  " " * level + "<h1>Ruby Study Group</h1>\n" + content
        content = inputTag(level, sectionTag, content)
        return content
      else
        level -= 1
        content = inputTag(level, sectionTag, content)
        if level == 0
          return content
        end
      end
    end
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

puts formatter.format