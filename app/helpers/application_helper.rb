module ApplicationHelper
  def title(page_title = nil)
    page_title.nil? ? content_for(:title, "Your Senedd | The Home of Welsh Politics") : content_for(:title, page_title.to_s)
  end

  def locale_method(english, welsh)
    if I18n.locale == :cy && !welsh.nil?
      welsh
    else
      english
    end
  end
end
