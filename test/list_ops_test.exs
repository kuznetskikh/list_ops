defmodule ListOpsTest do
  use ExUnit.Case
  doctest ListOps

  test "size of empty list" do
    assert ListOps.size([]) === 0
  end

  test "size of short list" do
    assert ListOps.size([1, 2]) === 2
  end

  test "size of long list" do
    assert ListOps.size([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) === 10
  end

  test "map to same type" do
    assert ListOps.map([1, 2, 3], fn item -> item * 2 end) === [2, 4, 6]
  end

  test "map to different primitive type" do
    assert ListOps.map([1, 2, 3, 4, 5], fn item ->
             "Item #{item}"
           end) === [
             "Item 1",
             "Item 2",
             "Item 3",
             "Item 4",
             "Item 5"
           ]
  end

  test "map to different complex type" do
    assert ListOps.map([1, 2], fn item ->
             {"Item #{item}", item}
           end) === [
             {"Item 1", 1},
             {"Item 2", 2}
           ]
  end

  test "reduce with primitive operation" do
    assert ListOps.reduce(
             [1, 2, 3, 4, 5],
             fn item, result ->
               item + result
             end,
             0
           ) === 15
  end

  test "reduce with complex operation" do
    assert ListOps.reduce(
             [1, 2, 3, 4, 5],
             fn item, result ->
               Map.put(result, "Item #{item}", item * 2)
             end,
             %{}
           ) === %{
             "Item 1" => 2,
             "Item 2" => 4,
             "Item 3" => 6,
             "Item 4" => 8,
             "Item 5" => 10
           }
  end
end
