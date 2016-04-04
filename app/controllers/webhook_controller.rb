class WebhookController < ApplicationController
  def add_entry
    if user = User.find_by_username(params["From"][0..params["From"].index("@")-1])
      if user.email == params["From"]
        description = if params["TextBody"].present?
          params["TextBody"]
        else
          "Lançamento enviado por e-mail"
        end
        entity = if params["Subject"].present? && I18n.transliterate(params["Subject"]).downcase == "credito"
          Entry.entities["credit"]
        else
          Entry.entities["debit"]
        end
        entry = Entry.create(user: user, responsible: user, description: description, value: 0, entity: entity, at: Date.today)
      end
    end
    render nothing: true
  end
end
