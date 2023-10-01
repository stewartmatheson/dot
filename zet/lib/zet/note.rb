# typed: strong

module Zet
  # Note class
  class Note
    extend T::Sig

    sig { params(title: String).void }
    def initialize(title:)
      @title = title
    end

    sig { returns(NilClass) }
    def render
      puts '---'
      puts @title
      puts '---'
    end
  end
end
