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

end
