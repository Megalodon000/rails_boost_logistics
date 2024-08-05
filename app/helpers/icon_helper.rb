module IconHelper
  def icon(style, name, **options)
    classes = [style, "fa-#{name}", options[:class]].compact.join(" ")
    content_tag(:i, nil, class: classes)
  end
end
