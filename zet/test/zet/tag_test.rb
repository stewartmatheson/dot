# typed: false

require 'zet'
module Zet
  class TagTest < Minitest::Test
    def test_true_is_false
      assert_equal true, true
    end
  end
end
