defmodule Nosh.Formats.Atom do
  use Saxaboom.Mapper

  alias Nosh.Formats.AtomEntry

  document do
    element :title
    element :subtitle, as: :description
    element :link, as: :url, value: :href, with: [type: "text/html"]
    element :link, as: :feed_url, value: :href, with: [rel: "self"]
    elements :link, as: :links, value: :href
    elements :link, as: :hubs, value: :href, with: [rel: "hub"]
    elements :entry, as: :entries, into: %AtomEntry{}
    element :icon
  end
end
