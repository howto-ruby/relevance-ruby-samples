# codecite instruct
xml.instruct! :xml, :version=>"1.0" 
# codecite widgets
xml.widgets do
  # codecite loop
  @widgets.each do |widget|
    # codecite attributes
    xml.widget(:created_at => widget.created_at, :updated_at => widget.updated_at) do
      # codecite child elements
      xml.name(widget.name)
      xml.color(widget.color)
      xml.weight(widget.weight)
    end
  end
end