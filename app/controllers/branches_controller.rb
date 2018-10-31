# frozen_string_literal: true

class BranchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :find_branch, only: [:show,:edit,:update,:destroy]

  def index
    @branches = Branch.all
  end

  def show; end

  def new
    @branch = Branch.new
  end

  def edit; end

  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_branch
    @branch = Branch.find(params[:id])
  end

  def branch_params
    params.require(:branch).permit(:ifsc, :number, :street, :city, :state, :pincode, :address)
  end
end
