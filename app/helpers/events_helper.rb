module EventsHelper
  def event_photo(photo)
    link_to (image_tag rails_blob_url(photo), class: "img-fluid mt-2", style: "width: 600px"),
            rails_blob_url(photo),
            data: {
              lightbox: "example-set",
              title: "Event photo"
            }
  end
end
