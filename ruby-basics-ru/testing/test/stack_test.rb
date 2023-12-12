# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new [1, 2, 3]
  end

  def test_add_stack_success
    initial_size = @stack.size
    @stack.push! 4

    assert { initial_size < @stack.size }
  end

  def test_remove_stack_success
    initial_size = @stack.size
    @stack.pop!

    assert { initial_size > @stack.size }
  end

  def test_clear_stack_success
    @stack.clear!

    assert { @stack.size == 0 }
  end

  def test_empty_stack_success
    @stack.clear!

    assert { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
