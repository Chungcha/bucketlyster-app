class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update]

	def index
	    @items = Item.all
	end 
	
	def show
  	end

	def new
	    @item = Item.new
	end

	def create
	  @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
	end

	def edit
	end

	def update
    if @item.update(item_params)
	    redirect_to item_path(@item)
    else 
      render :edit
    end
	end

	def destroy
	  Item.destroy(params[:id])
	  redirect_to items_path
	end

	private

	def item_params
	  params.require(:item).permit(:content, :creator_id, :list_id, :status)
	end

  def find_item
    @item = Item.find(params[:id])
  end
end
