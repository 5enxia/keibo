class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.new
    @categories = Category.all.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url
    else
    end
  end
  

  def edit
  end

  def destroy
    # カテゴリを削除したとき，対象カテゴリのpaymentのcatetory_idを1に設定
    @category_params = Payment.where(category_id: params[:id]).update_all(category_id: 1)
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
