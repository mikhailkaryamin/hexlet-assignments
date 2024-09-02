# frozen_string_literal: true
require 'minitest/autorun'

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_push!
    @stack.push!('one')
    expected_array = ['one']

    assert(@stack.to_a == expected_array)
  end

  def test_pop
    @stack.push!('one')
    @stack.push!('two')
    @stack.push!('three')

    @stack.pop!

    expected_array = ['one', 'two']

    assert(expected_array === @stack.to_a)
  end

  def test_clear
    @stack.push!('one')
    @stack.push!('two')
    @stack.push!('three')

    @stack.clear!

    assert(@stack.to_a.empty?)
  end

  def test_empty
    assert(@stack.to_a.empty?)
  end

  def after_teardown
    @stack.clear!
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
