class Patterns

  def initialize(emails)
    @emails = emails
  end

  def frequency
    pattern_array = [first_name_dot_last_name,
                     first_initial_dot_last_name,
                     first_name_dot_last_initial,
                     first_initial_dot_last_initial].reduce Hash.new, :merge

    max_value = pattern_array.values.max
    pattern_array.select { |k, v| v == max_value }.keys
  end

  def first_name_dot_last_name
    result = Hash.new
    result[:first_name_dot_last_name] = remove_domain.select { |email| email if email.split('.').first.length > 1 && email.split('.').last.length > 1}.length
    result
  end

  def first_initial_dot_last_name
    result = Hash.new
    result[:first_initial_dot_last_name] = remove_domain.select { |email| email if email.split('.').first.length == 1 && email.split('.').last.length > 1 }.length
    result
  end

  def first_name_dot_last_initial
    result = Hash.new
    result[:first_name_dot_last_initial] = remove_domain.select { |email| email if email.split('.').first.length > 1 && email.split('.').last.length == 1 }.length
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
