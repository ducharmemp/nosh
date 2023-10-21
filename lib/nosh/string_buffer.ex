defmodule Nosh.StringBuffer do
    defstruct [buffer: []]

    def stringify(%__MODULE__{buffer: buffer}) do
      buffer
      |> Enum.reverse()
      |> :erlang.iolist_to_binary()
    end

    defimpl Saxaboom.ElementCollectable do
      def element_definition(_collectable, _element), do: %{into: %@for{}}
      def attribute_definitions(_collectable, _element), do: []

      def cast_attributes(collectable, _),
        do: collectable

      def cast_characters(collectable, _, characters),
        do: %{collectable | buffer: [characters | collectable.buffer]}

      def cast_nested(collectable, _, _),
        do: collectable
    end
  end
