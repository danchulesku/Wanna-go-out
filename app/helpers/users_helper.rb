module UsersHelper
  def avatar(user)
    if user.avatar.attached?
      image_tag rails_blob_url(user.avatar),
                class: "mb-3 mt-1 rounded-circle",
                style: "width: 300px; height: 300px; object-fit: cover;"
    else
      image_tag asset_path("default_avatar.png"), style: "width: 300px; height: 300px;"
    end
  end

  def short_name(name)
    name.length > 19 ? name[0...19] + "..." : name
  end

  def small_avatar(user)
    if user.avatar.attached?
      image_tag rails_blob_url(user.avatar), class: 'img-fluid rounded-circle', style: "width: 30px; height: 30px;"
    else
      default_avatar
    end
  end

  def default_avatar
    image_tag asset_path("default_avatar.png"), style: "width: 32px; height: 32px;"
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
