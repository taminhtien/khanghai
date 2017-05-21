class FilePreviewInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    out = ActiveSupport::SafeBuffer.new

    if object.send("#{attribute_name}?")
      out << (
        '<div>' +
        object.send("#{attribute_name}_file_name").truncate(50) +
        '</div>'
      ).html_safe
    end

    out << @builder.file_field(attribute_name, input_html_options)
  end
end
