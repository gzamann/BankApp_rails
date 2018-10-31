# frozen_string_literal: true

class LoansController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @loans = Loan.all
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def edit
  end

  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:loan_type, :amount, :client_id)
  end
end
