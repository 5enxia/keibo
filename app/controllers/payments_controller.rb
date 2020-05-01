class PaymentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = current_user
        @payments = current_user.payments.paginate(page: params[:page])
    end


    def create
        @categories = Category.all.map{|c| [c.name, c.id]}
        @payment = current_user.payments.build(payment_params)

        if @payment.save
            flash[:success] = "収支が追加されました"
            redirect_to request.referrer || payments_url
        else
            render 'static_pages/home'
        end
    end

    def edit
        @payment = current_user.payments.find(params[:id])
        @categories = Category.all.map{|c| [c.name, c.id]}
    end

    def update
        @payment = current_user.payments.find(params[:id])
        if @payment.update_attributes(payment_params)
            flash[:success] = "更新しました"
            redirect_to request.referrer || payments_url
        else
            render 'edit'
        end
    end
    
    def destroy
        @payments = current_user.payments.find(params[:id])
        @payments.destroy
        flash[:success] = "削除しました"
        redirect_to request.referrer || payments_url
    end

    private
        def payment_params
            params.require(:payment).permit(:content, :price, :category_id, :date)
        end
end
