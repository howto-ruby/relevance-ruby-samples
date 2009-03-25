# codecite header
class LabelledFormBuilder < ActionView::Helpers::FormBuilder
  # codecite header
  
  # codecite text field
  def text_field(method, options={})
    '<p>' + label(method) + '<br/>' + super + '</p>'
  end
  # codecite text field
  
  # codecite helper list
  helpers_to_label = field_helpers - %w[label fields_for hidden_field apply_form_for_options!]
  # codecite helper list
  
  # codecite override helpers
  helpers_to_label.each do |helper|
    eval %{
      def #{helper}(method, options={})
        '<p>' + label(method) + '<br/>' + super + '</p>'
      end
    }
  end
  # codecite override helpers
end