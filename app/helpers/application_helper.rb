module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
    HTML
  end

  def update_method_input
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="put">
    HTML
  end
end
