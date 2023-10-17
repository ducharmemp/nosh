defmodule Nosh.Formats.Rss2Entry do
  alias Nosh.Formats.Rss2Image
  use Saxaboom.Mapper

  document do
    element :title
    element :"itunes:subtitle", as: :subtitle

    element :ttl

    element :description, as: :summary
    element :language
    element :lastBuildDate, as: :last_built, cast: &Nosh.Casting.parse_rfc_822/1

    element :"content:encoded", as: :content
    element :"a10:content", as: :content

    element :link, as: :url
    element :"a10:link", as: :url, value: :href

    element :author
    element :"itunes:author", as: :itunes_author

    element :"dc:creator", as: :author
    element :"a10:name", as: :author

    element :pubDate, as: :published, cast: &Nosh.Casting.parse_rfc_822/1
    element :pubdate, as: :published, cast: &Nosh.Casting.parse_rfc_822/1
    element :issued, as: :published, cast: &Nosh.Casting.parse_rfc_822/1
    element :"dc:date", as: :published, cast: &Nosh.Casting.parse_rfc_822/1
    element :"dc:Date", as: :published, cast: &Nosh.Casting.parse_rfc_822/1
    element :"dcterms:created", as: :published, cast: &Nosh.Casting.parse_rfc_822/1

    element :"dcterms:modified", as: :updated, cast: &Nosh.Casting.parse_rfc_822/1
    element :"a10:updated", as: :updated, cast: &Nosh.Casting.parse_rfc_822/1

    element :"dc:identifier", as: :dc_identifier

    element :"media:thumbnail", as: :image, into: %Rss2Image{}
    element :"media:content", as: :image, into: %Rss2Image{}
    element :enclosure, as: :image, into: %Rss2Image{}
    element :"itunes:image", as: :image, into: %Rss2Image{}

    element :comments

    elements :category, as: :categories
  end
end
