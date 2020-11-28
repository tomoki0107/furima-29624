class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        pay_item
        @user_purchase.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :content, :info, :category_id, :condition_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
