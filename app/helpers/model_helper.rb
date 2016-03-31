module ModelHelper
  def entries
    Entry.all
  end

  def last_entries
    Entry.order("at DESC")
  end
end
