defmodule NoshTest do
  use ExUnit.Case
  doctest Nosh

  test "greets the world" do
    assert Nosh.hello() == :world
  end
end
