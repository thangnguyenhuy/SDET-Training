require 'app'
require_relative '../../lib/item.rb'

describe Todo do
  before do
    @task = Todo.new
  end

  it "task empty at beginning" do
    expect(@task.tasks_list).to eq []
  end

  it "creates a task" do
    @task.add_task('Do homework', false)
    expect(@task.tasks_list).to eq ['Do homework']
  end

  it "creates multiple tasks" do
    @task.add_task('Task 1', false)
    @task.add_task('Task 2', false)
    @task.add_task('Task 3', false)
    @task.add_task('Task 4', false)
    expect(@task.tasks_list).to eq ['Task 1', 'Task 2', 'Task 3', 'Task 4']
  end

  it "mark a task as done" do
    @task.add_task('Task A', false)
    @task.add_task('Task B', false)
    @task.mark_done('Task B')
    expect(@task.undone_list).to eq ['Task A']
    expect(@task.done_list).to eq ['Task B']
  end

  it "mark some tasks as done" do
    @task.add_task('Task A', false)
    @task.add_task('Task B', false)
    @task.add_task('Task C', true)
    @task.mark_done('Task B')
    expect(@task.undone_list).to eq ['Task A']
    expect(@task.done_list).to eq ['Task B', 'Task C']
  end


  it "mark some tasks as undone" do
    @task.add_task('Task A', true)
    @task.add_task('Task B', true)
    @task.add_task('Task C', true)
    @task.mark_undone('Task A')
    @task.mark_undone('Task B')
    expect(@task.undone_list).to eq ['Task A', 'Task B']
    expect(@task.done_list).to eq ['Task C']
  end

  it "edits a name of task" do
    @task.add_task('Task A', false)
    @task.edit('Task A', 'Task new edit')
    expect(@task.tasks_list).to eq ['Task new edit']
  end

  it "edits a name then mark this task done" do
    @task.add_task('Task A', false)
    @task.edit('Task A', 'Task new edit')
    @task.mark_done('Task new edit')
    expect(@task.done_list).to eq ['Task new edit']
    expect(@task.undone_list).to eq []
  end
end