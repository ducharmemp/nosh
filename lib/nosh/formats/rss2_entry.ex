defmodule Nosh.Formats.Rss2Entry do
  use Saxaboom.Mapper

  document do
    element :title
    element :"itunes:subtitle", as: :subtitle

    element :ttl

    element :description, as: :summary
    element :language
    element :lastBuildDate, as: :last_built

    element :"content:encoded", as: :content
    element :"a10:content", as: :content

    element :link, as: :url
    element :"a10:link", as: :url, value: :href

    element :author
    element :"itunes:author", as: :itunes_author

    element :"dc:creator", as: :author
    element :"a10:name", as: :author

    element :pubDate, as: :published
    element :pubdate, as: :published
    element :issued, as: :published
    element :"dc:date", as: :published
    element :"dc:Date", as: :published
    element :"dcterms:created", as: :published

    element :"dcterms:modified", as: :updated
    element :"a10:updated", as: :updated

    # element :guid, as: :entry_id, class: Feedjira::Parser::GloballyUniqueIdentifier
    element :"dc:identifier", as: :dc_identifier

    element :"media:thumbnail", as: :image, value: :url
    element :"media:content", as: :image, value: :url
    element :enclosure, as: :image, value: :url
    element :"itunes:image", value: :href, as: :image

    element :comments

    elements :category, as: :categories
  end
end
