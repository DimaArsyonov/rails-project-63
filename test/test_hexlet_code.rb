# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

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
    result = HexletCode.form_for(user) {  } # need for test
    assert_instance_of String, result
  end

  def test_if_only_user
    expected_result = '<form action="#" method="post"></form>'
    user = User.new
    result = HexletCode.form_for(user) {  } # need for test
    assert_equal expected_result, result
  end

  def test_if_have_some_attributes
    expected_result = '<form action="#" method="post" class="hexlet-form"></form>'
    user = User.new
    attrs = { class: 'hexlet-form' }
    result = HexletCode.form_for(user, **attrs) {  } # need for test
    assert_equal expected_result, result
  end

  def test_if_have_url_in_attrs
    expected_result = '<form action="/profile" method="post" class="hexlet-form"></form>'
    user = User.new
    attrs = { class: 'hexlet-form', url: '/profile' }
    result = HexletCode.form_for(user, **attrs) {  } # need for test
    assert_equal expected_result, result
  end

  def test_if_input_only_one_parameter
    expected_result = File.read('test/fixtures/test_if_input_only_one_parameter.html')
    user = User.new name: 'rob'
    result = HexletCode.form_for user do |f|
      f.input :name
    end
    assert_equal expected_result, result
  end

  def test_if_input_with_as_option
    expected_result = File.read('test/fixtures/test_if_input_with_as_option.html')
    user = User.new job: 'hexlet'
    result = HexletCode.form_for user do |f|
      f.input :job, as: :text
    end
    assert_equal expected_result, result
  end

  def test_if_input_have_additional_attributes
    expected_result = File.read('test/fixtures/test_if_input_have_additional_attributes.html')
    user = User.new name: 'rob', job: 'hexlet'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal expected_result, result
  end

  def test_if_input_have_default_values
    expected_result = File.read('test/fixtures/test_if_input_have_default_values.html')
    user = User.new job: 'hexlet'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal expected_result, result
  end

  def test_if_input_raises_error_if_no_such_field
    user = User.new name: 'rob', job: 'hexlet'
    assert_raises(NoMethodError) do
      HexletCode.form_for(user, url: '/users') do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
