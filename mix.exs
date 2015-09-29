defmodule Echo.Mixfile do
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
    [:logger] ++ applications(:prod)
  end

  defp applications(_) do
    []
  end

  defp deps do
    [
      {:ex_doc, ">=0.1.0", only: [:test]},
      {:mailman, "~> 0.2.0", only: [:test]},
        {:eiconv, github: "zotonic/eiconv", only: [:test]},
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
      A basic notification dispatch system, composed from many adapters. Useful for email, sms, analytics, logs, etc.
    """
  end

end
