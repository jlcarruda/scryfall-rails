require 'json'

module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do

    end
  end

  private

  def response_error(_e)
    raise Scryfall::ResponseError
  end
end
