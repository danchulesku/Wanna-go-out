module ApplicationHelper
  def user_avatar(user)
    asset_path("default_avatar.png")
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
