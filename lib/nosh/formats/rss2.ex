defmodule Nosh.Formats.Rss2 do
  use Saxaboom.Mapper

  alias Nosh.Formats.Rss2Entry
  alias Nosh.Formats.Rss2Image

  document do
    element :title
    element :description
    element :image, into: %Rss2Image{}
    element :language
    element :lastBuildDate, as: :last_built, cast: &Nosh.Casting.parse_rfc_822/1
    element :link, as: :url
    element :"a10:link", as: :url, value: :href
    element :ttl
    elements :"atom:link", as: :hubs, value: :href, with: [rel: "hub"]

    elements :item, as: :entries, into: %Rss2Entry{}
  end
end
