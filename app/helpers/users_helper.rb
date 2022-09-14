module UsersHelper
  def avatar(user)
    if user.avatar.attached?
      image_tag rails_blob_url(user.avatar), class: "img-fluid mb-3 rounded-circle", style: "width: 400px;"
    else
      image_tag asset_path("default_avatar.png"), style: "width: 400px;"
    end
  end

  def small_avatar(user)
    if user.avatar.attached?
      image_tag rails_blob_url(user.avatar), class: 'img-fluid rounded-circle', style: "width: 45px;"
    else
      image_tag asset_path("default_avatar.png"), style: "width: 45px;"
    end
  end
end
