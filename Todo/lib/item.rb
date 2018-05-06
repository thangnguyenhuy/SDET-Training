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

  def mark_undone_item
    @done = false
  end

  def get_name
    @name
  end

  def get_done
    @done
  end
end
