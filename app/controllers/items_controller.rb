class ItemsController < ApplicationController
  #before_action :set_item, only: %i[ edit update destroy ]
  before_action :set_item, only: %i[ destroy ]

  load_and_authorize_resource

  def move
    #debugger
    @item = Item.find(params[:id])
    @item.update(row_order_position: params[:row_order_position], list_id: params[:list_id])
    head :no_content
  end

  def clone
    #debugger
    @item_source = Item.find(params[:sortable_item_id])
    @item = Item.new(
      list_id: params[:list_id],
      user: current_user,
      name: @item_source.name + "(" + current_user.username + ")",
      body: @item_source.body,
      color: @item_source.color,
      row_order_position: params[:row_order_position]
    )
    #debugger
    @item.save
    head :no_content

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.list_id = 1
    @item.user = current_user
    @item.color = random_color

    respond_to do |format|
      if @item.save
        format.html { redirect_to schedules_url, notice: "item 생성 성공!" }
        format.turbo_stream
      else
        format.html { redirect_to schedules_url, status: :unprocessable_entity }
      end
    end
  end

  #def edit
  #end

  #def update
    #respond_to do |format|
      #if @item.update(list_params)
        #format.html { redirect_to lists_url, notice: "Item was successfully updated." }
      #else
        #format.html { redirect_to lists_url, status: :unprocessable_entity }
      #end
    #end
  #end

  def destroy
    @item.destroy!
    respond_to do |format|
      format.html { redirect_to schedules_path, notice: "삭제 성공!" }
      #format.turbo_stream
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:body, :name)
    end

    def random_color
      floor=22
      r=(rand(256-floor)+floor).to_s 16
      g=(rand(256-floor)+floor).to_s 16
      b=(rand(256-floor)+floor).to_s 16
      color=[r,g,b].map{|h|h.rjust 2,'0'}.join
      puts "##############################################################################"
      puts color
      puts "##############################################################################"
      color
    end
end
