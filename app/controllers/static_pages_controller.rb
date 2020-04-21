class StaticPagesController < ApplicationController
  def home
    @payment = Payment.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def help
  end

  def contact
  end

  def about
    
  end
  
end
