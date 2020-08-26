defmodule ListOps do
  @moduledoc """
    Basic list operations without usage of default modules.
  """
  def size([] = _list) do
    0
  end

  def size([_head | tail] = _list) do
    1 + size(tail)
  end

  def map(list, mapper) do
    for item <- list do
      mapper.(item)
    end
  end

  def reduce([] = _list, _reducer, result) do
    result
  end

  def reduce([head | tail] = _list, reducer, result) do
    reduce(tail, reducer, reducer.(head, result))
  end
end
