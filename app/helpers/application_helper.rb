module ApplicationHelper
  #Чтоб название отображалось если его нет
  def full_title(page_title = '')
    base_title = "Бухдир"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
