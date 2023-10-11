defmodule Nosh.Formats.AtomEntry do
  use Saxaboom.Mapper

  alias Nosh.SimpleAggregator

  document do
    element :id, as: :entry_id

    element :title,
      with: [type: "html"],
      into: %SimpleAggregator{},
      cast: &__MODULE__.reencode_raw_content/1

    element :title,
      with: [type: "xhtml"],
      into: %SimpleAggregator{},
      cast: &__MODULE__.reencode_raw_content/1

    element :title,
      with: [type: "xml"],
      into: %SimpleAggregator{},
      cast: &__MODULE__.reencode_raw_content/1

    element :title, with: [type: "text"]
    element :title

    element :name, as: :author
    element :content, into: %SimpleAggregator{}, cast: &__MODULE__.reencode_raw_content/1
    element :summary
    element :enclosure, as: :image, value: :href

    element :published, cast: &Nosh.Casting.parse_iso/1
    element :created, as: :published, cast: &Nosh.Casting.parse_iso/1
    element :issued, as: :published, cast: &Nosh.Casting.parse_iso/1
    element :updated, cast: &Nosh.Casting.parse_iso/1
    element :modified, as: :updated, cast: &Nosh.Casting.parse_iso/1

    elements :category, as: :categories, value: :term

    element :link,
      as: :url,
      value: :href,
      with: [
        type: "text/html",
        rel: "alternate"
      ]

    elements :link, as: :links, value: :href

    element :"media:thumbnail", as: :image, value: :url
    element :"media:content", as: :image, value: :url
  end

  def reencode_raw_content(%SimpleAggregator{children: [root_of_content]})
      when is_binary(root_of_content),
      do: root_of_content |> String.trim()

  def reencode_raw_content(%SimpleAggregator{children: [root_of_content]}) do
    SimpleAggregator.stringify(root_of_content) |> String.trim()
  end
end
