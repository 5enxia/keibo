class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @payment = current_user.payments.build
    end
  end

  def help
  end

  def contact
  end

  def about
    
  end
  
end
