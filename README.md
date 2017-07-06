# RFC5646

Test strings against [RFC 5646](https://tools.ietf.org/html/rfc5646)

## Usage

```elixir
RFC5646.valid?("sandwich") #=> false
RFC5646.valid?("en-US") #=> true
RFC5646.valid?(["en-US", "en-GB"]) #=> true
```

## Installation

Add `rfc5646` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:rfc5646, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/rfc5646](https://hexdocs.pm/rfc5646).

