class ExpensesController < ApplicationController
	#	before_action :authenticate_user!, except: [:show, :index]
	before_action :find_expense, only: [:show, :edit, :update, :destroy] 


  def index
  	@expenses=Expense.search(params[:search])
  end

	def edit
  end

  def update
  	if @expense.update(expense_params)
  		redirect_to expenses_path, notice: "Expense sucessfully changed."
  	else
  		flash.now[:error]="An error prevente the expense from being updated"
  		render :edit
  	end
  end

  def new
  	@expense = Expense.new
  end
 
  def create
 		@expense = Expense.new(expense_params)
 		if @expense.save
  		redirect_to expenses_path, Notice: 'New expense created successfully.'
  	else
  		flash.now[:error] = 'An error prevented new expense to be created.'
  		render :new
  	end
  end

  def destroy
  	@expense.destroy
  	redirect_to expenses_path, notice: "Expense successfully deleted."
  end


private

	def find_expense
		@expense=Expense.find(params[:id])
	end

	def expense_params
		params.require(:expense).permit(:name, :exp_group_id)
	end

end
