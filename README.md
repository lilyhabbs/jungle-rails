# Jungle

An e-commerce web app that allows users to purchase products online. Admins are able to add products and create product categories.

## Screenshots

**Home page / full product listing**
!["Homepage"](https://github.com/lilyhabbs/jungle-rails/blob/master/docs/homepage.png)

**Registration page with validation errors**
!["Registration"](https://github.com/lilyhabbs/jungle-rails/blob/master/docs/registration_with_error.png)

**Stripe payment screen**
!["Payment"](https://github.com/lilyhabbs/jungle-rails/blob/master/docs/payment.png)

**Order confirmation page**
!["Registration"](https://github.com/lilyhabbs/jungle-rails/blob/master/docs/order_confirmation.png)

**Admin section: listing of all products**
!["Admin > Products"](https://github.com/lilyhabbs/jungle-rails/blob/master/docs/admin_products.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a [Stripe account](https://stripe.com/en-ca)
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Use a valid expiration date in the future and any random CVC number, to create a successful transaction.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
