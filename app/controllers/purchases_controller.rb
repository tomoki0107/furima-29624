class PurchasesController < ApplicationController

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        @user_purchase.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
