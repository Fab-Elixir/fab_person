defmodule Fab.Person.MixProject do
  use Mix.Project

  def project do
    [
      app: :fab_person,
      version: "0.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp deps do
    [
      {:fab, "~> 1.0"},
      {:ex_doc, "== 0.37.3", only: :dev, runtime: false},
      {:dialyxir, "== 1.4.5", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      authors: ["Anthony Smith"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/Fab-Elixir/fab_person"
      }
    }
  end
end
