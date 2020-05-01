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
    # デフォルトカテゴリを設定
    if Category.find_by(id:1).nil?
      Category.create(id:1, name:'デフォルト')
    end
    # カテゴリを削除したとき，対象をデフォルトカテゴリに設定
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
