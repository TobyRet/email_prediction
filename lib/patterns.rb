class Patterns

  def initialize(emails)
    @emails = emails
  end

  def first_name_dot_last_name(emails)
    formatted_emails = remove_domain(emails)
    puts formatted_emails
    { first_name_dot_last_name: formatted_emails.map { |email| email if email.split('.').first.length != 1 }.length }
  end

  def remove_domain(emails)
    emails.map { |k, v| emails[k].split('@').first }
  end

end
