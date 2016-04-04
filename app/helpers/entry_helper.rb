module EntryHelper
  def entry_by(entry)
    if entry.user_id == entry.responsible_id
      "#{h_date(entry.at).capitalize}, #{entry.responsible.name}"
    else
      "#{h_date(entry.at).capitalize}, #{entry.responsible.name} (lançado por #{entry.user.name})"
    end
  end

  def entry_value(entry)
    if entry.credit?
      "<span class='font-green font-bold'>+ #{number_with_precision(entry.value)}</span>".html_safe
    elsif entry.debit?
      "<span class='font-red font-bold'>- #{number_with_precision(entry.value)}</span>".html_safe
    end
  end

  def entry_credit
    number_with_precision(Entry.credit.sum(:value))
  end

  def entry_debit
    number_with_precision(Entry.debit.sum(:value))
  end

  def entry_total
    number_with_precision((Entry.credit.sum(:value) - Entry.debit.sum(:value)).abs)
  end

  def entry_total_positive?
    (Entry.credit.sum(:value) - Entry.debit.sum(:value)) >= 0
  end
end