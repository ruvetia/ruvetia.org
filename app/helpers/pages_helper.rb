module PagesHelper
  def map(src)
    raw "<iframe class='map' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='#{src}&amp;output=embed&amp;'></iframe>"
  end

  def ribbon(text, options={})
    content_tag :div, class: "fancy-divider " do
      content_tag :div, class: "ribbon-wrapper ribbon-#{options[:class]}" do
        content_tag(:div, text, class: "ribbon-front") +
        content_tag(:div, "",   class: "ribbon-edge-topleft") +
        content_tag(:div, "",   class: "ribbon-edge-topright") +
        content_tag(:div, "",   class: "ribbon-edge-bottomleft") +
        content_tag(:div, "",   class: "ribbon-edge-bottomright") +
        content_tag(:div, "",   class: "ribbon-back-left") +
        content_tag(:div, "",   class: "ribbon-back-right")
      end
    end
  end
end
