require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @task = tasks(:one)
  end

  test "checks that a task can be read" do
    get task_url(@task.id)

    assert_response :success
    assert_select 'h2', 'MyString'
  end

  test "checks that a task can be destroy" do
    assert_difference("Task.count", -1) do
      delete task_url(@task.id)
    end

    assert_redirected_to tasks_path
  end

  test "checks that a task can be updated" do
    patch task_url(@task), params: { task: { name: "updated" } }

    assert_redirected_to task_path(@task)

    @task.reload
    assert_equal "updated", @task.name
  end


  test "checks that a task can be created" do
    assert_difference("Task.count") do
      post tasks_url(@task), params: { task: {
        name: 'New task',
        description: 'MyText',
        status: 'MyString',
        creator: 'MyString',
        performer: 'MyString',
        completed: false
        } }
    end

    assert_response :redirect
  end

  test "checks that a task can NOT be created" do
    assert_no_difference("Task.count") do
      post tasks_url(@task), params: { task: {
        description: 'MyText',
        status: 'MyString',
        creator: 'MyString',
        performer: 'MyString',
        completed: false
        } }
    end

    assert_response 422
  end
end
