# typed: strong

module Zet
  # Note class which will take in params and output a result.
  class Note
    extend T::Sig

    sig { params(tags: String, body: String).void }
    def initialize(tags:, body:)
      @tags = tags
      @body = body
    end

    sig { returns(NilClass) }
    def render
      puts '---'
      puts "tags: #{@tags}"
      puts '---'
      puts @body
      puts '---'
      puts path
    end

    private

    sig { returns(String) }
    def path
      "#{home_folder}#{date_folder_prefix}#{slug}.md"
    end

    sig { returns(String) }
    def slug
      "#{Dir.home}/.zet"
    end

    sig { returns(String) }
    def home_folder
      ""
    end

    sig { returns(String) }
    def date_folder_prefix
      Time.now.strftime('%Y/%m/%d')
    end

  end
end
