defmodule Nosh.Casting do
  def parse_iso(date) do
    case Timex.parse(date, "{ISO:Extended}") do
      {:ok, parsed} -> parsed
      _ -> nil
    end
  end

  def parse_rfc_822(date) do
    case Timex.parse(date, "{RFC1123}") do
      {:ok, parsed} -> parsed
      _ -> nil
    end
  end
end
