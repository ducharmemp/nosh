defmodule Nosh.Formats.Rss2Image do
  use Saxaboom.Mapper

  document do
    element :description
    element :width, cast: :integer
    element :height, cast: :integer
    element :link
    element :title
    element :url, as: :link

    attribute :width, cast: :integer
    attribute :height, cast: :integer
    attribute :href, as: :link
    attribute :url, as: :link
  end
end
