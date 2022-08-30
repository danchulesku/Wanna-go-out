module EventsHelper
  def event_photo(photo)
    link_to (image_tag photo.variant(resize_to_fit: [300, 300]), class: "img-fluid w-50 mt-2"),
            rails_blob_url(photo), target: :_blank
  end
end
