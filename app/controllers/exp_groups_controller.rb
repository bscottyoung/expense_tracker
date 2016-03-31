class ExpGroupsController < ApplicationController
	#	before_action :authenticate_user!, except: [:show, :index]
	before_action :find_exp_group, only: [:show, :edit, :update, :destroy] 


  def index
  	# binding.pry
  	@exp_groups=ExpGroup.search(params[:search])
  # 	binding.pry
  end

	def edit
#		binding.pry
  end

  def update
  	if @exp_group.update(exp_group_params)
  		redirect_to exp_groups_path, notice: "Expense group sucessfully changed."
  	else
  		flash.now[:error]="An error prevented the expense group_by from being updated"
  		render :edit
  	end
  end

  def new
  	# binding.pry
  	@exp_group = ExpGroup.new
  	# binding.pry
  end
 
  def create
  	# binding.pry
 		@exp_group = ExpGroup.new(exp_group_params)
 		# binding.pry
 		if @exp_group.save
  		redirect_to exp_groups_path, Notice: 'New expense group created successfully.'
  	else
  		flash.now[:error] = 'An error prevented new expense group to be created.'
  		render :new
  	end
  end

  def destroy
  	@exp_group.destroy
  	redirect_to exp_groups_path, notice: "Expense group successfully deleted."
  end


private

	def find_exp_group
#		binding.pry
		@exp_group=ExpGroup.find(params[:id])
	end

	def exp_group_params
		# binding.pry
		params.require(:exp_group).permit(:name, :expense_id)
	end

end
