defmodule Fab.Person.MixProject do
  use Mix.Project

  def project do
    [
      app: :fab_person,
      description:
        "Fab.Person is an Elixir library for generating random information about a person",
      version: "1.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      docs: docs(),
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp docs do
    [
      main: Fab.Person
    ]
  end

  defp deps do
    [
      {:fab, "~> 1.2"},
      {:ex_doc, "== 0.38.1", only: :dev, runtime: false},
      {:dialyxir, "== 1.4.5", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      authors: ["Anthony Smith"],
      licenses: ["MIT"],
      links: %{
        Fab: "https://hexdocs.pm/fab/Fab.html",
        GitHub: "https://github.com/Fab-Elixir/fab_person"
      }
    }
  end
end
