# frozen_string_literal: true

class BranchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @branch = Branch.new
    respond_to do |format|
      format.json { render json: { branch: @branch }, status: :ok }
    end
  end

  def show
    @branch = Branch.find(params[:id])
    respond_to do |format|
      format.json { render json: { branch: @branch }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @branch = Branch.new(branch_params)
    respond_to do |format|
      if @branch.save
        format.json { render json: { branch: @branch }, status: :created }
      else
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    respond_to do |format|
      @branch.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def index
    @branchs = Branch.all
    respond_to do |format|
      format.json { render json: { branchs: @branchs }, status: :ok }
    end
  end

  def edit
    @branch = Branch.find(params[:id])
    respond_to do |format|
      format.json { render json: { branch: @branch }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    @branch = Branch.find(params[:id])
    respond_to do |format|
      if @branch.update(branch_params)
        format.json { render json: { branch: @branch }, status: :ok }
      else
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:ifsc, :address, :number)
  end
end
