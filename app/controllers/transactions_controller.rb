class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @transaction = Transaction.new
    respond_to do |format|
    format.json { render json: {transaction: @transaction}, status: :ok }
    end
  end
    
  def show
    begin
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
    format.json { render json: {transaction:@transaction}, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
    format.json { render json: {error:e.message}, status: :not_found}
    end
    end
  end
    
  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.json { render json: { transaction: @transaction}, status: :created }
        else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    begin
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
    @transaction.destroy
    format.json { render json: {}, status: :ok }
    end  
        rescue ActiveRecord::RecordNotFound => e
          respond_to do |format|
            format.json { render json: {error:e.message}, status: :unprocessable_entity }
          end
        end
      end
    
      def index
        @transactions = Transaction.all
        respond_to do |format|
          format.json { render json: {transactions:@transactions}, status: :ok }
        end
      end
    
      def edit
        begin
          @transaction = transaction.find(params[:id])
          respond_to do |format|
            format.json { render json: {transaction:@transaction}, status: :ok }
          end
        rescue ActiveRecord::RecordNotFound => e
          respond_to do |format|
            format.json { render json: {error:e.message}, status: :not_found }
          end
        end
      end
    
      def update
        begin
          @transaction = Transaction.find(params[:id])
          respond_to do |format|
            if @transaction.update(transaction_params)
              format.json { render json: {transaction:@transaction}, status: :ok }
            else
              format.json { render json: @transaction.errors, status: :unprocessable_entity }
            end
          end
        rescue => e
          respond_to do |format|
            format.json { render json: {error:e.message}, status: :unprocessable_entity }
          end
        end
      end
    
  private
    def transaction_params
    params.require(:transaction).permit(:name, :address, :phone_no)
    end
end