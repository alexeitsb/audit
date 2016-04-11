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

  def entry_credit(entries)
    number_with_precision(entries.credit.sum(:value))
  end

  def entry_debit(entries)
    number_with_precision(entries.debit.sum(:value))
  end

  def entry_total(entries)
    number_with_precision((entries.credit.sum(:value) - entries.debit.sum(:value)).abs)
  end

  def entry_total_positive?(entries)
    (entries.credit.sum(:value) - entries.debit.sum(:value)) >= 0
  end
end