defmodule Fab.Az.Person do
  @moduledoc false

  @behaviour Fab.Person

  @impl Fab.Person
  def first_name(opts) do
    opts
    |> Keyword.fetch!(:sex)
    |> do_first_name()
  end

  @spec do_first_name(:female | :male | :mixed) :: [String.t()]
  defp do_first_name(:female) do
    [
      "Adeliya",
      "Afaq",
      "Afərim",
      "Afət",
      "Aidə",
      "Alsu",
      "Anna",
      "Ayan",
      "Aydan",
      "Aygül",
      "Aygün",
      "Aylin",
      "Aynur",
      "Aytən",
      "Bahar",
      "Banu",
      "Billurə",
      "Bəyaz",
      "Cansu",
      "Ceyla",
      "Damla",
      "Diana",
      "Dilarə",
      "Dəniz",
      "Ella",
      "Ellada",
      "Elnarə",
      "Elvira",
      "Elyanora",
      "Elza",
      "Esmira",
      "Estella",
      "Fatimə",
      "Fidan",
      "Firuzə",
      "Fərqanə",
      "Fərəh",
      "Fəxriyyə",
      "Gövhər",
      "Gülay",
      "Gülsüm",
      "Gülçin",
      "Gülər",
      "Günay",
      "Humay",
      "Hülya",
      "Hüriyə",
      "Jalə",
      "Jasmin",
      "Kübra",
      "Lalə",
      "Lamiyə",
      "Laura",
      "Leyla",
      "Liliya",
      "Ləman",
      "Maya",
      "Mehriban",
      "Mələk",
      "Nigar",
      "Nuray",
      "Nurgün",
      "Nərgiz",
      "Ofelya",
      "Pəri",
      "Röya",
      "Selcan",
      "Səbinə",
      "Tansu",
      "Tuba",
      "Ulduz",
      "Ülkər",
      "Ülviyyə"
    ]
  end

  defp do_first_name(:male) do
    [
      "Abbas",
      "Abdulla",
      "Adil",
      "Afəl",
      "Akif",
      "Amid",
      "Anar",
      "Aqil",
      "Bəhram",
      "Bəhruz",
      "Bəxtiyar",
      "Elnur",
      "Emil",
      "Emin",
      "Faiq",
      "Kamran",
      "Nadir",
      "Nahid",
      "Natiq",
      "Nihad",
      "Nurlan",
      "Rafiq",
      "Rəşad",
      "Rəşid",
      "Tahir",
      "Tunar",
      "Tərlan",
      "Zahir",
      "Zaur",
      "İlham",
      "İlqar",
      "İxtiyar",
      "Şaiq",
      "Şəhriyar",
      "Əhməd"
    ]
  end

  defp do_first_name(:mixed) do
    [
      "Abbas",
      "Abdulla",
      "Adeliya",
      "Adil",
      "Afaq",
      "Afəl",
      "Afərim",
      "Afət",
      "Aidə",
      "Akif",
      "Alsu",
      "Amid",
      "Anar",
      "Anna",
      "Aqil",
      "Ayan",
      "Aydan",
      "Aygül",
      "Aygün",
      "Aylin",
      "Aynur",
      "Aytən",
      "Bahar",
      "Banu",
      "Billurə",
      "Bəhram",
      "Bəhruz",
      "Bəxtiyar",
      "Bəyaz",
      "Cansu",
      "Ceyla",
      "Damla",
      "Diana",
      "Dilarə",
      "Dəniz",
      "Ella",
      "Ellada",
      "Elnarə",
      "Elnur",
      "Elvira",
      "Elyanora",
      "Elza",
      "Emil",
      "Emin",
      "Esmira",
      "Estella",
      "Faiq",
      "Fatimə",
      "Fidan",
      "Firuzə",
      "Fərqanə",
      "Fərəh",
      "Fəxriyyə",
      "Gövhər",
      "Gülay",
      "Gülsüm",
      "Gülçin",
      "Gülər",
      "Günay",
      "Humay",
      "Hülya",
      "Hüriyə",
      "Jalə",
      "Jasmin",
      "Kamran",
      "Kübra",
      "Lalə",
      "Lamiyə",
      "Laura",
      "Leyla",
      "Liliya",
      "Ləman",
      "Maya",
      "Mehriban",
      "Mələk",
      "Nadir",
      "Nahid",
      "Natiq",
      "Nigar",
      "Nihad",
      "Nuray",
      "Nurgün",
      "Nurlan",
      "Nərgiz",
      "Ofelya",
      "Pəri",
      "Rafiq",
      "Röya",
      "Rəşad",
      "Rəşid",
      "Selcan",
      "Səbinə",
      "Tahir",
      "Tansu",
      "Tuba",
      "Tunar",
      "Tərlan",
      "Ulduz",
      "Zahir",
      "Zaur",
      "Ülkər",
      "Ülviyyə",
      "İlham",
      "İlqar",
      "İxtiyar",
      "Şaiq",
      "Şəhriyar",
      "Əhməd"
    ]
  end

  @impl Fab.Person
  def full_name(opts) do
    [
      %Fab.Template{
        bindings: [
          first_name: {Fab.Person, :first_name, [opts]}
        ],
        source: "<%= first_name %>"
      },
      %Fab.Template{
        bindings: [
          first_name: {Fab.Person, :first_name, [opts]},
          last_name: {Fab.Person, :last_name, [opts]}
        ],
        source: "<%= first_name %> <%= last_name %>"
      },
      %Fab.Template{
        bindings: [
          last_name: {Fab.Person, :last_name, [opts]},
          first_name: {Fab.Person, :first_name, [opts]}
        ],
        source: "<%= last_name %> <%= first_name %>"
      }
    ]
  end

  @impl Fab.Person
  def last_name(opts) do
    opts
    |> Keyword.fetch!(:sex)
    |> do_last_name()
  end

  @spec do_last_name(:female | :male | :mixed) :: [String.t()]
  defp do_last_name(:female) do
    [
      "Abdullayeva",
      "Qasımova",
      "Rəşidova",
      "Seyidova",
      "Soltanova",
      "Tahirova",
      "Vəsiyeva",
      "Əfəndiyeva",
      "Əliyeva",
      "Ələkbərova"
    ]
  end

  defp do_last_name(:male) do
    [
      "Məmmədov",
      "Nəzərov",
      "Quliyev",
      "Rəhimov",
      "Soltanov",
      "Vəliyev",
      "Xəlilov",
      "Əhmədov",
      "Əliyev",
      "Ələkbərov"
    ]
  end

  defp do_last_name(:mixed) do
    [
      "Abdullayeva",
      "Məmmədov",
      "Nəzərov",
      "Qasımova",
      "Quliyev",
      "Rəhimov",
      "Rəşidova",
      "Seyidova",
      "Soltanov",
      "Soltanova",
      "Tahirova",
      "Vəliyev",
      "Vəsiyeva",
      "Xəlilov",
      "Əfəndiyeva",
      "Əhmədov",
      "Əliyev",
      "Əliyeva",
      "Ələkbərov",
      "Ələkbərova"
    ]
  end
end
