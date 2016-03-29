module ModelHelper
  def entries
    Entry.all
  end

  def last_entries
    Entry.order("created_at DESC")
  end
end
