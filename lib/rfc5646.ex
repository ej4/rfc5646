defmodule RFC5646 do
  @moduledoc """
  Validate strings and lists of strings against RFC 5646.
  """

  @extlang "[[:alpha:]]{3}(-[[:alpha:]]{3}){0,2}"
  @language "[[:alpha:]]{2,3}(-#{@extlang}){0,1}"
  @script "[[:alpha:]]{4}"
  @region "([[:alpha:]]{2}|[[:digit:]]{3})"
  @variant "([[:alnum:]]{5,8}|[[:digit:]][[:alnum:]]{3})"
  @singleton "[0-9A-WY-Za-wy-z]"
  @extension "#{@singleton}(-[[:alnum:]]{2,8})+"
  @privateuse "x(-[[:alnum:]]{1,8})+"

  @irregular_tags ~w(
    en-GB-oed
    i-ami
    i-bnn
    i-default
    i-enochian
    i-hak
    i-klingon
    i-lux
    i-mingo
    i-navajo
    i-pwn
    i-tao
    i-tay
    i-tsu
    sgn-BE-FR
    sgn-BE-NL
    sgn-CH-DE)

  @regular_tags ~w(
    art-lojban
    cel-gaulish
    no-bok
    no-nyn
    zh-guoyu
    zh-hakka
    zh-min
    zh-min-nan
    zh-xiang)

  @grandfathered_tags @irregular_tags ++ @regular_tags

  @grandfathered "(#{Enum.join(@grandfathered_tags, "|")})"

  @language_tag @language
                <> "(-#{@script}){0,1}"
                <> "(-#{@region}){0,1}"
                <> "(-#{@variant})*"
                <> "(-#{@extension})*"
                <> "(-#{@privateuse}){0,1}"

  @rfc5646regex Regex.compile!(
    "\\A(#{@language_tag}|#{@grandfathered}|#{@privateuse})\\z")

  @doc """
  If given a list, validates each string in the list matches RFC 5646.
  If given a string, validates that string matches RFC 5646.

  ## Examples

      iex> RFC5646.valid?(["en-US", "en-GB"])
      true
      
      iex> RFC5646.valid?(["sandwich", "en-GB"])
      false
      
      iex> RFC5646.valid?("en-US")
      true
      
      iex> RFC5646.valid?("sandwich")
      false

  """
  def valid?(list) when is_list(list) do
    list |> Enum.all?(&valid?/1)
  end

  def valid?(string) do
    string |> String.match?(@rfc5646regex)
  end
end
