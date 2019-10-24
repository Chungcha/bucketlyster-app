class ListsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update]
	before_action :require_logged_in

	def index
			@lists = List.all
	end 
	
	def show
  end

	def new
	    @list = List.new
	end

	def create
	  @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
	end

	def edit
	end

	def update
    if @list.update(list_params)
	    redirect_to list_path(@list)
    else 
      render :edit
    end
	end

	def destroy
	  List.destroy(params[:id])
	  redirect_to lists_path
	end

	private

	def list_params
	  params.require(:list).permit(:title, :category, :creator_id, :search, items_attributes: [:content, :list_id, :status, :category])
	end

  def find_list
    @list = List.find(params[:id])
  end

end
