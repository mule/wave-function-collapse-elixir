defmodule WaveFunctionCollapse.Mixfile do
  use Mix.Project

  def project do
    [app: :waveFunctionCollapse,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:math, git: "https://github.com/folz/math"},
      {:imagineer, git: "https://github.com/SenecaSystems/imagineer"},
      {:tensor, git: "https://github.com/Qqwy/tensor"}
    ]
  end
end
