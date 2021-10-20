# Jungle

A mini e-commerce application built with Rails 4.2.

Elements of note:
1. Add new categories and products from admin page.
1. Display product name, price, description, image, and a sold out flag if inventory runs out.
1. Register new users with secure password authentication and unique email.
1. Integration of Stripe for payments.

## Screenshots
![Home page showing all products](https://github.com/diegojcastro/jungle-rails/blob/master/docs/products-index.jpg?raw=true)
![Product Details page showing name, description, quantity, price](https://github.com/diegojcastro/jungle-rails/blob/master/docs/product-show.jpg?raw=true)
![Shopping Cart view with listed items and total price](https://github.com/diegojcastro/jungle-rails/blob/master/docs/cart-details.jpg?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
