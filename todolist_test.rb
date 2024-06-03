require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift) && assert_nil(@list.find_by_title('Buy milk'))
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
    @list.mark_all_done
    assert(@list.done?)
  end

  def test_type_error_raised_by_add
    assert_raises(TypeError) do
      @list.add('Not a Todo object')
    end
  end

  def test_shovel_operator
    @todo4 = Todo.new('Do homework')
    @list << @todo4
    assert_equal(@todo4, @list.last)
  end

  def test_add
    new_todo = Todo.new('Do homework')
    @todos << new_todo
    @list.add(new_todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) do
      @list.item_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@list.item_at(0).done?)
    assert(!@list.item_at(1).done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert(!@list.item_at(1).done?)
    assert(@list.item_at(0).done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!
    assert(@todos.all? { |todo| todo.done? })
    assert(@list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @todo2.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @todos.each { |todo| todo.done! }

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    index = 0
    @list.each do |todo|
      assert_equal(@todos[index], todo)
      index += 1
    end
  end

  def test_each_return_value
    assert_equal(@list, @list.each {})
  end

  def test_select
    selected_list = @list.select do |todo|
      todo.title == 'Buy milk' || todo.title == 'Go to gym'
    end
    assert_equal([@todo1, @todo3], selected_list.to_a)
    refute_same(@list, selected_list)
  end
end