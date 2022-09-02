module EventsHelper
  def event_photo(photo)
    link_to (image_tag photo.variant(resize_to_fit: [600, 600]), class: "img-fluid mt-2"),
            rails_blob_url(photo)
  end
end
