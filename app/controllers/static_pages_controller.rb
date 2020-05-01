class StaticPagesController < ApplicationController
  
  def home
    # form
    @payment = Payment.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  

    if user_signed_in?
      # 集計
      @payments = current_user.payments
    end
  end

  def help
  end

  def contact
  end

  def about
    
  end
end
