class AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
    @account = Account.new
    respond_to do |format|
    format.json { render json: {account: @account}, status: :ok }
    end
  end
    
  def show
    begin
      @account = Account.find(params[:id])
      respond_to do |format|
      format.json { render json: {account:@account}, status: :ok }
      end
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
      format.json { render json: {error:e.message}, status: :not_found}
      end
    end
  end
    
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.json { render json: { account: @account}, status: :created }
      else
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    begin
      @account = Account.find(params[:id])
      respond_to do |format|
      @account.destroy
      format.json { render json: {}, status: :ok }
      end  
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
      format.json { render json: {error:e.message}, status: :unprocessable_entity }
      end
    end
  end
    
  def index
    @accounts = Account.all
    respond_to do |format|
    format.json { render json: {accounts:@accounts}, status: :ok }
    end
  end
    
  def edit
    begin
      @account = Account.find(params[:id])
      respond_to do |format|
      format.json { render json: {account:@account}, status: :ok }
      end
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
      format.json { render json: {error:e.message}, status: :not_found }
      end
    end
  end
    
  def update
    begin
      @account = Account.find(params[:id])
      respond_to do |format|
      if @account.update(account_params)
        format.json { render json: {account:@account}, status: :ok }
      else
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
      end
      rescue => e
      respond_to do |format|
        format.json { render json: {error:e.message}, status: :unprocessable_entity }
      end
    end
  end
    
  private
    def account_params
      params.require(:account).permit(:name, :address, :phone_no)
    end
end