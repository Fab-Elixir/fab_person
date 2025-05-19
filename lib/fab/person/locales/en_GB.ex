defmodule Fab.EnGB.Person do
  @moduledoc false

  @behaviour Fab.Person

  @impl Fab.Person
  def full_name(opts) do
    [
      %Fab.Template{
        bindings: [
          first_name: {Fab.Person, :first_name, [opts]},
          last_name: {Fab.Person, :last_name, [opts]}
        ],
        source: "<%= first_name %> <%= last_name %>"
      },
      %Fab.Template{
        bindings: [
          prefix: {Fab.Person, :prefix, [opts]},
          first_name: {Fab.Person, :first_name, [opts]},
          last_name: {Fab.Person, :last_name, [opts]}
        ],
        source: "<%= prefix %> <%= first_name %> <%= last_name %>"
      }
    ]
  end
end
