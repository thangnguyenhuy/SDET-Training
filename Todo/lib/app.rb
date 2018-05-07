class Todo

  def initialize
    @task = []
  end

  def add_task(name, done)
    @task << Item.new(name, done)
  end

  def tasks_list
    #  @task.map { |item| item.get_name }
    get_list_name(@task)
  end

  def get_list_name(task_list)
    task_list.map { |item| item.get_name }
  end

  def done_list
    done_list = @task.select { |item| item.get_done == true }
    get_list_name(done_list)
  end

  def undone_list
    undone_list = @task.select { |item| item.get_done == false }
    get_list_name(undone_list)
  end

  def mark_done(name)
    @task.each do |task|
      if task.get_name == name
        task.mark_done_item
      end
    end
  end

  def mark_undone(name)
    @task.each do |task|
      if task.get_name == name
        task.mark_undone_item
      end
    end
  end

  def edit(current_name, new_name)
    @task.each do |task|
      if task.get_name == current_name
        task.edit_name(new_name)
      end
    end
  end

  def search_task(task)
    get_list_name(@task).select { |item| item.downcase.include?(task.downcase) }
  end

end
