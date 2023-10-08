# typed: strong

require 'fileutils'

module Zet
  # Note class which will take in params and output a result.
  class Note
    extend T::Sig

    sig { params(tags: T.nilable(String), title: String).void }
    def initialize(tags:, title:)
      @tags = tags
      @title = title
    end

    sig { returns(NilClass) }
    def render
      if File.exist?(path)
        puts path
        return
      end

      create_directory
      File.open(path, 'w') do |file|
        output(file)
      end
      puts path
    end

    private

    sig { params(file: File).returns(NilClass) }
    def output(file)
      file.puts '---'
      file.puts "title: #{@title}"
      file.puts "tags: #{@tags}"
      file.puts '---'
      file.puts @title
      file.puts '---'
      file.puts path
    end

    sig { returns(NilClass) }
    def create_directory
      dirname = File.dirname(path)
      return if File.directory?(dirname)

      FileUtils.mkdir_p(dirname)
      nil
    end

    sig { returns(String) }
    def path
      "#{ENV.fetch('ZET_HOME')}/#{date_folder_prefix}/#{slug}.md"
    end

    sig { returns(String) }
    def slug
      @title.gsub("\n", '').gsub(' ', '-').downcase
    end

    sig { returns(String) }
    def date_folder_prefix
      Time.now.strftime('%Y/%m/%d')
    end
  end
end
