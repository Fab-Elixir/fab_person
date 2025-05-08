defmodule Fab.EnGB.Person do
  @moduledoc false

  @behaviour Fab.Person

  @impl Fab.Person
  def full_name do
    [
      "<%= first_name %> <%= last_name %>",
      "<%= prefix %> <%= first_name %> <%= last_name %>"
    ]
  end
end
