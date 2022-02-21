# 🚀 Flightex

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/flight-booking?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/flight-booking?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/flight-booking?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/flight-booking?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/flight-booking?style=flat)

> Project developed during the Elixir track on the Rocketseat platform.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir` on your machine.

If you need installation instructions, [click here](https://elixir-lang.org/install.html).

## 🚀 Installing Flightex

To install Flightex, follow these steps:

1º Clone the repository.

```
>  git clone https://github.com/joabehenrique/flight-booking.git
```
2º Navigate to the project folder.
```
>  cd rocketseat-exlivery/exlivery
```
3º Use the command below to download the dependencies.
```
>  mix deps.get
```
4º Use the command below to run the project.
```
>  iex -S mix
```
## ☕ Using Flightex

To use Flightex, follow these steps:

Creating a user and your application. 
```
> FlightBooking.start_agents
```
```
> {:ok, user} = %{name: "name", email: "name@email.com", cpf: "12345678900"}

> FlightBooking.create_or_update_user(user)
```
Searching created user
```
> FlightBooking.get_user "d42b7ff7-f907-4a1c-8c3a-484e5324e828"

{:ok,
 %FlightBooking.Users.User{
   cpf: "12345678900",
   email: "name@email.com",
   name: "name"
 }}
```
Searching all users 
```
> FlightBooking.get_all_users
```
Creating a booking
```
> {:ok, booking} = %{
    user_id: "d42b7ff7-f907-4a1c-8c3a-484e5324e828", 
    date: NaiveDateTime.utc_now(), 
    origin: "SP", 
    destination: "RJ"
  }

> FlightBooking.create_or_update_booking(booking)
```
Searching the reserve created
```
> FlightBooking.get_booking("a8a6d868-b78f-4bd1-9da1-7454728a1955")

{:ok,
 %FlightBooking.Bookings.Booking{
   date: ~N[2021-08-10 11:48:31.757414],
   destination: "RJ",
   origin: "SP",
   user_id: "d42b7ff7-f907-4a1c-8c3a-484e5324e828",
   user_name: "name"
 }}

```

## 📫 Contributing to Exlivery

To contribute to Exlivery, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin Flightex / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/joabehenrique">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/flight-booking/blob/master/CONTRIBUTING.md) and read how to contribute.

## 📝 License

This project is under license. See the [license](https://github.com/joabehenrique/flight-booking/blob/master/LICENSE.md) file for more details.