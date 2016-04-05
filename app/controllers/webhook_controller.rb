class WebhookController < ApplicationController
  protect_from_forgery with: :null_session

  def add_entry
    if user = User.find_by_username(params["From"][0..params["From"].index("@")-1])
      if user.email == params["From"]
        description = if params["TextBody"].present?
          params["TextBody"].gsub(/\d+[,]\d+/, "").gsub(/\d{1,2}\/\d{1,2}\/\d{4}/, "").gsub("\r\n", "").rstrip
        else
          "Lançamento enviado por e-mail"
        end
        value = params["TextBody"].scan(/\d+[,]\d+/).flatten.first || 0
        entity = if params["Subject"].present? && I18n.transliterate(params["Subject"]).downcase == "credito"
          Entry.entities["credit"]
        else
          Entry.entities["debit"]
        end
        at = params["TextBody"].scan(/\d{1,2}\/\d{1,2}\/\d{4}/).flatten.first || Date.today
        entry = Entry.create(user: user, responsible: user, description: description, value: value, entity: entity, at: at)
        if params["Attachments"].present?
          params["Attachments"].each do |attachment|
            file = Tempfile.new(attachment["Name"])
            file.write(attachment["Content"])
            entry.attachments.create(file: file)
          end
        end
      end
    end
    render nothing: true
  end
end
