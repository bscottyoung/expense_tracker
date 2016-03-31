class VendorsController < ApplicationController

	#	before_action :authenticate_user!, except: [:show, :index]
	before_action :find_vendor, only: [:show, :edit, :update, :destroy] 


  def index
  	# binding.pry
  	@vendors=Vendor.search(params[:search])
  # 	binding.pry
  end

	def edit
#		binding.pry
  end

  def update
  	if @vendor.update(vendor_params)
  		redirect_to vendors_path, notice: "Vendor sucessfully updated."
  	else
  		flash.now[:error]="An error prevented the vendor from being updated"
  		render :edit
  	end
  end

  def new
  	# binding.pry
  	@vendor = Vendor.new
  	# binding.pry
  end
 
  def create
  	# binding.pry
 		@vendor = Vendor.new(vendor_params)
 		# binding.pry
 		if @vendor.save
  		redirect_to vendors_path, Notice: 'New vendor created successfully.'
  	else
  		flash.now[:error] = 'An error prevented new vendor to be created.'
  		render :new
  	end
  end

  def destroy
  	@vendor.destroy
  	redirect_to vendors_path, notice: "vendor successfully deleted."
  end


private

	def find_vendor
#		binding.pry
		@vendor=Vendor.find(params[:id])
	end

	def vendor_params
		# binding.pry
		params.require(:vendor).permit(:name, :exp_group_id, :expense_id)
	end


end
