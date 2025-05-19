defmodule Fab.Person do
  @moduledoc """
  Functions for generating random information about a person.

  ## Supported Locales

  - `af_ZA`
  - `az`
  - `cs_CZ`
  - `da`
  - `de`
  - `de_AT`
  - `de_CH`
  - `dv`
  - `el`
  - `en`
  - `en_AU`
  - `en_GB`
  - `en_GH`
  - `en_HK`
  - `en_IN`
  - `en_NG`
  - `en_ZA`
  - `es`
  - `fr`
  - `ja`
  - `pt_BR`
  - `pt_PT`
  - `ru`
  - `zh_CN`
  """

  import Fab.Locale
  import Fab.Randomizer

  @type sex_t ::
          {:sex, :female | :male | :mixed}

  @callback first_name([sex_t]) ::
              [String.t()]

  @callback full_name([sex_t]) ::
              [Fab.Template.t()]

  @callback last_name([sex_t]) ::
              [String.t()]

  @callback middle_name([sex_t]) ::
              [String.t()]

  @callback prefix([sex_t]) ::
              [String.t()]

  @callback sex() ::
              [String.t()]

  @callback suffix() ::
              [String.t()]

  @optional_callbacks [
    first_name: 1,
    full_name: 1,
    last_name: 1,
    middle_name: 1,
    prefix: 1,
    sex: 0,
    suffix: 0
  ]

  @doc """
  Returns a random first name.

  ## Options

  - `:sex` – Can be `:female`, `:male`, or `:mixed`. Defaults to `:mixed`.

  ## Examples

      iex> Fab.Person.first_name()
      "Laury"

      iex> Fab.Person.first_name(sex: :female)
      "Hazel"

      iex> Fab.Person.first_name(sex: :male)
      "Darryl"
  """
  @spec first_name([sex_t]) :: String.t()
  def first_name(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    __MODULE__
    |> localize(:first_name, [[sex: sex]])
    |> random()
  end

  @doc """
  Generates a random full name.

  ## Options

  - `:first_name` - First name to use. Defaults to a randomly selected name
  based on `:sex`.
  - `:last_name` - Last name to use. Defaults to a randomly selected name based
  on `:sex`.
  - `:middle_name` - Middle name to use. Defaults to a randomly selected name
  based on `:sex`.
  - `:prefix` - Prefix to use. Defaults to a randomly selected prefix based on
  `:sex`.
  - `:sex` - Sex used to generate the first and last name. Can be `:female`,
  `:male` or `:mixed`. Defaults to `:mixed`.
  - `:suffix` - Suffix to use. Defaults to a randomly selected suffix based on
  `:sex`.

  ## Examples

      iex> Fab.Person.full_name()
      "Mrs. Greta Lebsack"

      iex> Fab.Person.full_name(first_name: "Anthony")
      "Anthony Cummings"

      iex> Fab.Person.full_name(last_name: "Smith")
      "Miss Waylon Smith"

      iex> Fab.Person.full_name(sex: :female)
      "Arlene Leffler"

      iex> Fab.Person.full_name(sex: :male)
      "Lyle Huel"
  """
  @spec full_name([sex_t]) :: String.t()
  def full_name(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    defaults = Keyword.take(opts, [:first_name, :last_name, :middle_name, :prefix, :suffix])

    __MODULE__
    |> localize(:full_name, [[sex: sex]])
    |> apply_defaults(defaults)
    |> random()
    |> Fab.Template.render()
  end

  @spec apply_defaults([Fab.Template.t()], keyword) :: [Fab.Template.t()]
  defp apply_defaults(templates, defaults) do
    Enum.map(templates, fn template ->
      bindings =
        Enum.map(template.bindings, fn {key, value} = binding ->
          if key in Keyword.keys(defaults) do
            {key, defaults[key] || value}
          else
            binding
          end
        end)

      %{template | bindings: bindings}
    end)
  end

  @doc """
  Returns a random last name.

  ## Options

  - `:sex` – Can be `:female`, `:male`, or `:mixed`. Defaults to `:mixed`.

  ## Examples

      iex> Fab.Person.last_name()
      "Toy"

      iex> Fab.Person.last_name(sex: :female)
      "Rowe"

      iex> Fab.Person.last_name(sex: :male)
      "Cronin"
  """
  @spec last_name([sex_t]) :: String.t()
  def last_name(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    __MODULE__
    |> localize(:last_name, [[sex: sex]])
    |> random()
  end

  @doc """
  Returns a random middle name.

  ## Options

  - `:sex` – Can be `:female`, `:male`, or `:mixed`. Defaults to `:mixed`.

  ## Examples

      iex> Fab.Person.middle_name()
      "Reign"

      iex> Fab.Person.middle_name(sex: :female)
      "Jolie"

      iex> Fab.Person.middle_name(sex: :male)
      "Monroe"
  """
  @spec middle_name([sex_t]) :: String.t()
  def middle_name(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    __MODULE__
    |> localize(:middle_name, [[sex: sex]])
    |> random()
  end

  @doc """
  Returns a random name prefix.

  ## Options

  - `:sex` – Can be `:female`, `:male`, or `:mixed`. Defaults to `:mixed`.

  ## Examples

      iex> Fab.Person.prefix()
      "Mrs."

      iex> Fab.Person.prefix(sex: :female)
      "Ms."

      iex> Fab.Person.prefix(sex: :male)
      "Mr."
  """
  @spec prefix([sex_t]) :: String.t()
  def prefix(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    __MODULE__
    |> localize(:prefix, [[sex: sex]])
    |> random()
  end

  @doc """
  Returns a random sex.

  ## Examples

      iex> Fab.Person.sex()
      "female"
  """
  @spec sex :: String.t()
  def sex do
    __MODULE__
    |> localize(:sex, [])
    |> random()
  end

  @doc """
  Returns a random name suffix.

  ## Examples

      iex> Fab.Person.suffix()
      "PhD"
  """
  @spec suffix :: String.t()
  def suffix do
    __MODULE__
    |> localize(:suffix, [])
    |> random()
  end
end
