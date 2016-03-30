module DateHelper
  def date(val)
    return val.strftime("%d/%m/%Y") if val
    return nil
  end

  def time(val)
    return val.strftime("%H:%M:%S") if val
    return nil
  end

  def datetime(val)
    return val.strftime("%d/%m/%Y %H:%M:%S") if val
    return nil
  end

  def h_datetime(val)
    if val && val.to_date == Date.today
      return "hoje #{val.strftime("%H:%M:%S")}"
    elsif val && val.to_date == Date.today - 1
      return "ontem #{val.strftime("%H:%M:%S")}"
    elsif val
      return "#{val.strftime("%d/%m/%Y %H:%M:%S")} (#{time_ago_in_words(val)})"
    else
      return nil
    end
  end

  def h_date(val)
    if val && val == Date.today
      return "hoje"
    elsif val && val == Date.today - 1
      return "ontem"
    elsif val
      return val.strftime("%d/%m/%Y")
    else
      return nil
    end
  end
end