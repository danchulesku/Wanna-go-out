module UsersHelper
  def avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize_to_fit: [400, 400]), class: "img-fluid mb-3 rounded-circle"
    else
      image_tag asset_path("default_avatar.png")
    end
  end
end
