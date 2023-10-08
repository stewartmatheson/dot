# typed: strong

module Zet
  class Tag
    extend T::Sig

    sig { params(file: T.any(String, Pathname)).void }
    def initialize(file:)
      @file = file
      @tags = T.let([], T::Array[String])
      File.readlines(@file).each do |line|
        process_line line
      end
    end

    sig { returns(NilClass) }
    def render
      return if @tags.empty?

      puts @tags
    end

    private

    sig { params(line: String).returns(T.untyped) }
    def process_line(line)
      process_tags(line) if line.match(/^tags:/)
    end

    sig { params(tag_line: String).returns(T.untyped) }
    def process_tags(tag_line)
      tag_line_parts = tag_line.split(':')
      return if tag_line_parts.length != 2
      return if tag_line_parts[1].nil?

      T.must(tag_line_parts[1]).split(',').each do |tag|
        @tags << tag.strip unless tag.strip.empty?
      end
    end
  end
end
