defmodule Nosh.MixProject do
  use Mix.Project

  def project do
    [
      app: :nosh,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:saxaboom, "~> 0.2"},
      {:saxy, "~> 1.5"},
      {:timex, "~> 3.7"}
    ]
  end
end
