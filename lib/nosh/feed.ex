defmodule Nosh.Feed do
  use Saxaboom.Mapper

  alias Nosh.Formats.Atom
  alias Nosh.Formats.Rss2

  document do
    # Atom
    element :feed, as: :feed, into: %Atom{}
    # RSS 2.0
    element :rss, as: :feed, with: [version: "2.0"], into: %Rss2{}
  end
end
