require 'dataset'

class Lookup

  include Dataset

  def initialize(target)
    @target = target
  end

  def search
    EMAILS.select do |key,value|
      EMAILS[key] if value.split('@').last == @target.domain
    end
  end

end
