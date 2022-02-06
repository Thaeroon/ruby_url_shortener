require "test_helper"

class UrlTestController
  include UrlUtils
end

class UrlTest < ActiveSupport::TestCase

  test "short url should string like" do
    controller = UrlTestController.new
    assert controller.shorten("123456789132456789").respond_to? :to_s
  end
  test "short url should be less than 11 char" do
    controller = UrlTestController.new
    assert controller.shorten("123456789132456789").length <= 10
  end
  test "short url should be more than 5 char" do
     controller = UrlTestController.new
     assert controller.shorten("123456789132456789").length >= 6
   end
  test "short url should be all lowercase" do
    controller = UrlTestController.new
    string = controller.shorten("123456789132456789")
    assert_equal string, string.downcase
  end

end