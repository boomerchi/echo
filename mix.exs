defmodule Aeacus.Mixfile do
  use Mix.Project

  def project do
    [
      app: :echo,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      description: description,
      package: package,
      deps: deps
    ]
  end

  def application do
    [applications: applications(Mix.env)]
  end

  #
  # Private
  #

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["test/support"] ++ elixirc_paths(:prod)
  defp elixirc_paths(_),     do: ["lib"]


  defp applications(:test) do
    applications(:prod)
  end

  defp applications(_) do
    [:logger]
  end

  defp deps do
    [
      {:ex_doc, github: "elixir-lang/ex_doc", only: [:dev, :test]},
      {:earmark, ">= 0.0.0", only: [:dev, :test]},
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      contributors: ["Zachary Moshansky"],
      licenses: ["BSD 3-Clause"],
      links: %{"GitHub" => "https://github.com/zmoshansky/echo"}
    ]
  end

  defp description do
    """
      A basic notification dispatch system, composed from many adapters. Deliver emails, sms, etc.
    """
  end

end
