defmodule Nosh.Formats.Rss2 do
  use Saxaboom.Mapper

  alias Nosh.Formats.Rss2Entry

  document do
    element :rss, as: :version, value: :version
    element :title
    element :link
    element :description
    element :language
    element :ttl

    elements :item, as: :entries, into: %Rss2Entry{}
  end
end
