class ItemsController < ApplicationController
  #before_action :set_item, only: %i[ edit update destroy ]
  before_action :set_item, only: %i[ destroy ]

  def sort
    #debugger
    @item = Item.find(params[:id])
    @item.update(row_order_position: params[:row_order_position], list_id: params[:list_id])
    head :no_content
  end

  def create
    #debugger
    @item_source = Item.find(params[:sortable_item_id])
    @item = Item.new(list_id: params[:list_id], user: current_user, body: @item_source.body, row_order_position: params[:row_order_position])
    #debugger
    @item.save
    head :no_content

    # 혹시 stimulus가 처리하기로 했으면 얘는 처리 못하는 거 아닐까...
    #respond_to do |format|
      #if @item.save
        #format.html { redirect_to lists_url, notice: "item 생성 성공!" }
      #else
        #format.html { redirect_to lists_url, status: :unprocessable_entity }
      #end
    #end
  end

  #def edit
  #end

  #def update
    #respond_to do |format|
      #if @item.update(list_params)
        #format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        #format.json { render :show, status: :ok, location: @item }
      #else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  def destroy
    if @item.user == current_user
      @item.destroy!
      respond_to do |format|
        format.html { redirect_to lists_path, notice: "삭제 성공!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to lists_path, status: :unprocessable_entity }
        put "니께 아닌데 어째 지울 수 있겄냐"
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
