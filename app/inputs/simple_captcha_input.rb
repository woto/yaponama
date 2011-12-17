class SimpleCaptchaInput < SimpleForm::Inputs::Base
  def input
    "#{@builder.show_simple_captcha(:object => attribute_name, :label => '', :image_style => 'all_black')}".html_safe
  end
end
