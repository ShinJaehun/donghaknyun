class ItemsController < ApplicationController
  before_action :set_item, only: %i[ edit update ]

  def sort
    #debugger
    @item = Item.find(params[:id])
    @item.update(row_order_position: params[:row_order_position], list_id: params[:list_id])
    head :no_content
  end

  def clone
    #debugger
    @item_source = Item.find(params[:id])
    @item = Item.new(list_id: params[:list_id], user: current_user, body: @item_source.body, row_order_position: params[:row_order_position])
    #debugger
    @item.save
    head :no_content
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.update(list_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:body)
    end
end
