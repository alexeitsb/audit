module ModelHelper
  def users
    User.all
  end

  def entries
    Entry.all
  end

  def last_entries
    Entry.order(["at DESC", "created_at DESC"])
  end
end
