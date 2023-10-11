defmodule Nosh.SimpleAggregator do
  import Saxy.XML

  defstruct [:name, :attributes, children: []]

  def stringify(%__MODULE__{name: name, attributes: attributes, children: children}) do
    element(name, attributes |> Map.to_list, children |> Enum.map(&stringify/1))
    |> Saxy.encode!()
  end

  defimpl Saxaboom.ElementCollectable do
    def element_definition(_collectable, _element), do: %{into: %@for{}}
    def cast_attributes(collectable, element), do: %{collectable | name: element.name, attributes: element.attributes}
    def cast_characters(collectable, element, characters), do: %{collectable | name: element.name, children: collectable.children ++ [characters]}
    @spec cast_nested(%Nosh.SimpleAggregator{}, atom | %{:name => any, optional(any) => any}, any) ::
            %{:children => [...], :name => any, optional(any) => any}
    def cast_nested(collectable, element, nested), do: %{collectable | name: element.name, children: collectable.children ++ [nested]}
  end
end
