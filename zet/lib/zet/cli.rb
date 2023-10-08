# typed: strict

module Zet
  # The CLI class will parse incoming commands and call the correct class
  class CLI
    extend T::Sig

    sig { void }
    def execute
      return note if mode == 'note'
      return tags if mode == 'tags'

      raise StandardError, "Unknown mode: #{mode}"
    end

    private

    sig { void }
    def note
      tags = ARGV[1]
      title = $stdin.gets || ''
      Note.new(tags:, title:).render
    end

    sig { returns(T::Array[String]) }
    def tags
      $stdin.readlines.each do |line|
        Tag.new(file: line.strip).render
      end
    end

    sig { returns(String) }
    def mode
      ARGV[0].to_s
    end
  end
end
