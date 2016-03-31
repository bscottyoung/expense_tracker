class TransactionsController < ApplicationController

#	before_action :authenticate_user!, except: [:show, :index]
  before_action :find_transaction, only: [:show, :edit, :update, :destroy] 


  def index
  	@transactions=Transaction.search(params[:search])
  end

  def show
  end

  def edit
  end

  def update
  	if @transaction.update(transaction_params)
  		redirect_to transactions_path, notice: "Transaction sucessfully changed."
  	else
  		flash.now[:error]="An error prevente the transaction from being updated"
  		render :edit
  	end
  end

  def new
  	@transaction = Transaction.new
  end
 
  def create
 		@transaction = Transaction.new(transaction_params)
 		if @transaction.save
  		redirect_to transactions_path, Notice: 'New ransaction created successfully.'
  	else
  		flash.now[:error] = 'An error prevented new transaction to be created.'
  		render :new
  	end
  end

  def destroy
  	@transaction.destroy
  	redirect_to transactions_path, notice: "Transaction successfully deleted."
  end


private

	def find_transaction
		@transaction=Transaction.find(params[:id])
	end

	def transaction_params
		params.require(:transaction).permit(:amt, :tdate, :desc, :taxable_flag, :photo_receipt, :expense_id, :exp_group_id, :vendor_id)
	end

end
