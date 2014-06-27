require 'dataset'
require 'patterns'

class Lookup

  include Dataset

  def initialize(target)
    @target = target
  end

  def search
    EMAILS.select { |key,value| EMAILS[key] if value.split('@').last == @target.domain }
  end

  def retrieve_pattern
    emails = search
    patterns = Patterns.new(emails)
    patterns.frequency
  end

  def format_email

    case
    when retrieve_pattern.include?(:first_name_dot_last_name)
      create_first_name_dot_last_name
      #when retrieve_pattern.include?(:first_initial_dot_last_name)
      #  create_first_initial_dot_last_name
    when retrieve_pattern.include?(:first_name_dot_last_initial) && retrieve_pattern.include?(:first_name_dot_last_initial)
      [create_first_initial_dot_last_name, create_first_name_dot_last_initial]
    when retrieve_pattern.include?(:first_initial_dot_last_initial)
      create_first_initial_dot_last_initial
    else
      "Sorry, not enough data to make prediction"
    end
  end

  def create_first_name_dot_last_name
    split_name = @target.name.split
    "#{split_name[0]}.#{split_name[1]}@#{@target.domain}"
  end

  def create_first_initial_dot_last_name
    split_name = @target.name.split
    "#{split_name[0][0]}.#{split_name[1]}@#{@target.domain}"
  end

  def create_first_name_dot_last_initial
    split_name = @target.name.split
    "#{split_name[0]}.#{split_name[1][0]}@#{@target.domain}"
  end

  def create_first_initial_dot_last_initial
    split_name = @target.name.split
    "#{split_name[0][0]}.#{split_name[1][0]}@#{@target.domain}"
  end

end
