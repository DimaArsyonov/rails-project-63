# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_if_user_arg_is_from_user_class
    user = User.new
    assert_instance_of User, user
  end

  def test_if_user_class_is_from_struct
    user = User.new
    assert_equal Struct, user.class.superclass
  end

  def test_if_output_is_string
    user = User.new
    result = HexletCode.form_for(user) { |f| }
    assert_instance_of String, result
  end

  def test_if_only_user
    expected_result = "<form action=\"#\" method=\"post\"></form>"
    user = User.new
    result = HexletCode.form_for(user) { |f| }
    assert_equal expected_result, result
  end

  def test_if_have_some_attributes
    expected_result = "<form action=\"#\" method=\"post\" class=\"hexlet-form\"></form>"
    user = User.new
    attrs = { class: "hexlet-form" }
    result = HexletCode.form_for(user, **attrs) { |f| }
    assert_equal expected_result, result
  end

  def test_if_have_url_in_attrs
    expected_result = "<form action=\"/profile\" method=\"post\" class=\"hexlet-form\"></form>"
    user = User.new
    attrs = { class: "hexlet-form", url: "/profile" }
    result = HexletCode.form_for(user, **attrs) { |f| }
    assert_equal expected_result, result
  end
end
