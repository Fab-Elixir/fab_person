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
  - `en`
  - `es`
  """

  import Fab.Locale
  import Fab.Randomizer

  @type sex_t ::
          {:sex, :female | :male | :mixed}

  @callback first_name([sex_t]) ::
              [String.t()]

  @callback full_name() ::
              [String.t()]

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
    full_name: 0,
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
      "Ciara"

      iex> Fab.Person.first_name(sex: :female)
      "Cheryl"

      iex> Fab.Person.first_name(sex: :male)
      "Erik"
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
      "Osbaldo Reilly"

      iex> Fab.Person.full_name(first_name: "Anthony")
      "Anthony Schuppe"

      iex> Fab.Person.full_name(last_name: "Smith")
      "Miss Orville Smith"

      iex> Fab.Person.full_name(sex: :female)
      "Dr. Amy Romaguera"

      iex> Fab.Person.full_name(sex: :male)
      "Mr. Bryan Reichert"
  """
  @spec full_name([sex_t]) :: String.t()
  def full_name(opts \\ []) do
    sex = Keyword.get(opts, :sex, :mixed)

    bindings = [
      prefix: Keyword.get(opts, :prefix, prefix(sex: sex)),
      first_name: Keyword.get(opts, :first_name, first_name(sex: sex)),
      middle_name: Keyword.get(opts, :middle_name, middle_name(sex: sex)),
      last_name: Keyword.get(opts, :last_name, last_name(sex: sex)),
      suffix: Keyword.get(opts, :suffix, suffix())
    ]

    __MODULE__
    |> localize(:full_name, [])
    |> random()
    |> EEx.eval_string(bindings)
  end

  @doc """
  Returns a random last name.

  ## Options

  - `:sex` – Can be `:female`, `:male`, or `:mixed`. Defaults to `:mixed`.

  ## Examples

      iex> Fab.Person.last_name()
      "Reinger"

      iex> Fab.Person.last_name(sex: :female)
      "Lehner"

      iex> Fab.Person.last_name(sex: :male)
      "Glover"
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
      "Jules"

      iex> Fab.Person.middle_name(sex: :female)
      "Ellen"

      iex> Fab.Person.middle_name(sex: :male)
      "William"
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
      "Mr."

      iex> Fab.Person.prefix(sex: :female)
      "Dr."

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
      "male"
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
      "DVM"
  """
  @spec suffix :: String.t()
  def suffix do
    __MODULE__
    |> localize(:suffix, [])
    |> random()
  end
end
