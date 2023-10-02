# typed: strong

module Zet
  # Note class which will take in params and output a result.
  class Note
    extend T::Sig

    sig { params(title: String, body: String).void }
    def initialize(title:, body:)
      @title = title
      @body = body
    end

    sig { returns(NilClass) }
    def render
      puts '---'
      puts @title
      puts '---'
      puts @body
    end

  end
end
