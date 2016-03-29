module ImageHelper
  def img_blank
    image_tag "blank.png"
  end

  def img_help(title = nil)
    image_tag "help.jpeg", style: "height: 13px;", title: title
  end
end
