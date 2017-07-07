defmodule RFC5646.Mixfile do
  use Mix.Project

  def project do
    [app: :rfc5646,
     version: "0.1.0",
     name: "RFC5646",
     description: description(),
     source_url: "https://github.com/ej4/rfc5646",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, "~> 0.16", only: :dev}]
  end
  
  defp description do
    """
    Validate a string or list of strings against RFC 5646
    """
  end
  
  defp package do
    [
      name: :rfc5646,
      maintainers: ["Adam Bowen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ej4/rfc5646"}
    ]
  end
end
