class PurchaseRecordsController < ApplicationController
  def index
    @record_destination = RecordDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_destination = RecordDestination.new(purchase_record_params)
    if @record_destination.valid?
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:record_destination).permit(:post_code, :prefectute, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
