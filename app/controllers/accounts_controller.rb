class AccountsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def create
    @account = Account.find_or_create_by(user: current_user)
    # this calls the stripe/stripe_account class
    service = StripeAccount.new(@account)
    # create account and onboarding are methods in the class
    service.create_account
    redirect_to service.onboarding_url, allow_other_host: true, status: :see_other
  end    
end
