defmodule ImpowerElixir.Id do
  def token() do

    Enum.random(1_00000..9_99999)

  end
end
