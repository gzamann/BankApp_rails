class LoansController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
    @loan = Loan.new
    respond_to do |format|
      format.json { render json: {loan: @loan}, status: :ok }
    end
  end
    
  def show
    begin
      @loan = Loan.find(params[:id])
      respond_to do |format|
        format.json { render json: {loan:@loan}, status: :ok }
      end
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: {error:e.message}, status: :not_found}
      end
    end
  end
    
  def create
    @loan = Loan.new(loan_params)
    respond_to do |format|
    if @loan.save
      format.json { render json: { loan: @loan}, status: :created }
    else
      format.json { render json: @loan.errors, status: :unprocessable_entity }
    end
    end
  end
    
  def destroy
    begin
      @loan = Loan.find(params[:id])
      respond_to do |format|
      @loan.destroy
      format.json { render json: {}, status: :ok }
      end  
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: {error:e.message}, status: :unprocessable_entity }
      end
    end
  end
    
  def index
    @loans = Loan.all
    respond_to do |format|
      format.json { render json: {loans:@loans}, status: :ok }
    end
  end
    
  def edit
    begin
      @loan = loan.find(params[:id])
      respond_to do |format|
        format.json { render json: {loan:@loan}, status: :ok }
      end
      rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json { render json: {error:e.message}, status: :not_found }
      end
    end
  end
    
  def update
    begin
      @loan = Loan.find(params[:id])
      respond_to do |format|
      if @loan.update(loan_params)
        format.json { render json: {loan:@loan}, status: :ok }
      else
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
      end
      rescue => e
      respond_to do |format|
        format.json { render json: {error:e.message}, status: :unprocessable_entity }
      end
    end
  end
    
  private
    def loan_params
      params.require(:loan).permit(:name, :address, :phone_no)
    end
end