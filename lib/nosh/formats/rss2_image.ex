defmodule Nosh.Formats.Rss2Image do
  use Saxaboom.Mapper

  document do
    element :description
    element :height
    element :link
    element :title
    element :url
    element :width
  end
end
