# frozen_string_literal: true

require 'json'

module ErrorHandler
  def self.included(klass)
    klass.class_eval do
    end
  end

  private

  def response_error(_err)
    raise Scryfall::ResponseError
  end
end
