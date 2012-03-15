module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def form_div(label, field)
    content_tag :div, :class => "control-group" do
      raw(label + content_tag(:div, field, :class => "controls"))
    end
  end


end
