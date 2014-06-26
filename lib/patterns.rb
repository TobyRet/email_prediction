class Patterns

  def initialize(emails)
    @emails = emails
  end

  def frequency
  end

  def first_name_dot_last_name
    result = Hash.new
    result[:first_name_dot_last_name] = remove_domain.select { |email| email if email.split('.').first.length != 1 }.length
    result
  end

  def first_initial_dot_last_name
    result = Hash.new
    result[:first_initial_dot_last_name] = remove_domain.select { |email| email if email.split('.').first.length == 1 }.length
    result
  end

  def first_name_dot_last_initial
    result = Hash.new
    result[:first_name_dot_last_initial] = remove_domain.select { |email| email if email.split('.').last.length == 1 }.length
    result
  end

  def first_initial_dot_last_initial
    result = Hash.new
    result[:first_initial_dot_last_initial] = remove_domain.select { |email| email if email.length == 3 }.length
    result
  end


  def remove_domain
    @emails.map { |k, v| @emails[k].split('@').first }
  end

end
