class Todo
  # attr_reader :task

  def initialize
    @task = []
  end

  def add_task(name, done)
    @task << Item.new(name, done)
  end

  def tasks_list
     @task.each_with_object([]) { |item, list| list << item.get_name }
  end

  def done_list
    done_list = @task.select { |item| item.get_done == true }
    done_list.each_with_object([]) { |item, list| list << item.get_name }
  end

  def undone_list
    undone_list = @task.select { |item| item.get_done == false }
    undone_list.each_with_object([]) { |item, list| list << item.get_name }
  end

  def mark_done(name)
    @task.each do |task|
      if task.get_name == name
        task.mark_done_item
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
end

class Item
  def initialize(name, done)
    @name = name
    @done = done
  end

  def mark_done_item
    @done = true
  end

  def edit_name(new_name)
    @name = new_name
  end

  def get_name
    @name
  end

  def get_done
    @done
  end
end
