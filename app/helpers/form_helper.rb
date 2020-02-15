module FormHelper
  def render_error(record, attr)
    return if record.errors[attr].empty?

    content_tag(
      :div,
      id: "#{record.class.name.titleize.parameterize(separator: '_')}_#{attr}_errors",
      class: 'alert alert-danger'
    ) do
      render_errors(record, attr)
    end
  end

  private

  def render_errors(record, attr)
    errors = record.errors[attr].map do |error|
      content_tag(:div, error, class: 'error')
    end

    safe_join(errors)
  end
end
