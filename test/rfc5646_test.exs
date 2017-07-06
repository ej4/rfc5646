defmodule RFC5646Test do
  use ExUnit.Case
  doctest RFC5646

  test "correctly formatted languages pass" do
    assert RFC5646.valid?("en-US")
    assert RFC5646.valid?("en")
  end

  test "grandfathered languages pass" do
    assert RFC5646.valid?("i-klingon")
    assert RFC5646.valid?("zh-min-nan")
  end
  
  test "incorrectly formatted languages do not pass" do
    refute RFC5646.valid?("klingon")
  end
end
