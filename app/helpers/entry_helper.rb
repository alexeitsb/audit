module EntryHelper
  def by(entry)
    "#{h_date(entry.at)} por #{entry.user.name}"
  end

  def entry_value(entry)
    if entry.credit?
      "<span class='font-green font-bold'>+ #{number_with_precision(entry.value)}</span>".html_safe
    elsif entry.debit?
      "<span class='font-red font-bold'>- #{number_with_precision(entry.value)}</span>".html_safe
    end
  end
end