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

  def shared_links_login_icon(provider)
    case provider
    when :github
      return '<i class="fa-brands fa-github" style="color: #181617"></i>'.html_safe
    when :google_oauth2
      return '<i class="fa-brands fa-google" style="color: #21A300"></i>'.html_safe
    end
  end

  def user_friendly_provider(provider)
    if provider == :google_oauth2
      "Google"
    else
      provider
    end
  end
end
