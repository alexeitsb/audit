module FormHelper
  def top(resource)
    render partial: "partials/form_top", locals: { resource: resource }
  end

  def required_attribute?(resource, attribute)
    resource.class.validators_on(attribute).map(&:class).include?(ActiveRecord::Validations::PresenceValidator)
  end

  def valid_attribute?(resource, attribute)
    resource.errors[attribute].empty?
  end

  def invalid(resource)
    render partial: "partials/form_invalid", locals: { resource: resource }
  end

  def error_message(resource, attribute)
    resource.errors.messages[attribute].first || ""
  end

  def t_field(form, resource, attribute, css_class = "", autofocus = false)
    render partial: "partials/form_text_field", locals: { form: form, resource: resource, attribute: attribute, css_class: css_class, autofocus: autofocus }
  end

  def t_area(form, resource, attribute)
    render partial: "partials/form_text_area", locals: { form: form, resource: resource, attribute: attribute }
  end

  def s_responsibles(form, selected_id)
    render partial: "partials/form_select_responsibles", locals: { form: form, selected_id: selected_id }
  end
end