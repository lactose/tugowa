module ApplicationHelper
  def title
    base_title = "tugowa"
    if @title.nil? 
      base_title
    else
      "#{@title}"
    end
  end
end
