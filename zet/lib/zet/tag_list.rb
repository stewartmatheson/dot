# typed: false

module Zet
  # This was written while testing a keybaord. We should delete it.
  class TagList
    def self.search
      file_database.each do |file|
        puts file
      end
    end

    def hello; end
  end
end
