require 'stripe'

Stripe.api_key = Rails.application.secrets.stripe_secret_key

Stripe.api_version = '2017-04-06'