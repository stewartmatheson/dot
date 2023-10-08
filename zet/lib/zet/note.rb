# typed: strong

module Zet
  # Note class which will take in params and output a result.
  class Note
    extend T::Sig

    sig { params(tags: String, title: String).void }
    def initialize(tags:, title:)
      @tags = tags
      @title = title
    end

    sig { returns(NilClass) }
    def render
      puts '---'
      puts @title
      puts "tags: #{@tags}"
      puts '---'
      puts @title
      puts '---'
      puts path
    end

    private

    sig { returns(String) }
    def path
      "#{home_folder}/#{date_folder_prefix}/#{slug}.md"
    end

    sig { returns(String) }
    def slug
      @title.gsub("\n", '').gsub(' ', '-').downcase
    end

    sig { returns(String) }
    def home_folder
      "#{Dir.home}/.zet"
    end

    sig { returns(String) }
    def date_folder_prefix
      Time.now.strftime('%Y/%m/%d')
    end

  end
end
