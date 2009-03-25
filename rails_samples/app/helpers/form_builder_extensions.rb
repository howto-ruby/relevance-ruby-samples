module FormBuilderExtensions
  def labelled_field(type, field)
    "<p>#{label field}<br />#{self.send type, field}</p>"
  end
end
