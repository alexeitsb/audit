module ImageHelper
  def img_blank
    image_tag "blank.png"
  end

  def img_help(title = nil)
    image_tag "help.jpeg", style: "height: 13px;", title: title
  end

  def img_attachments(title = nil)
    image_tag "attachment.png", style: "height: 22px;", title: title
  end

  def img_trash(title = nil)
    image_tag "trash.png", style: "height: 22px;", title: title
  end
end
