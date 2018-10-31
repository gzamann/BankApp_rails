# frozen_string_literal: true

class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @client = Client.new
    respond_to do |format|
      format.json { render json: { client: @client }, status: :ok }
    end
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.json { render json: { client: @client }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.json { render json: { client: @client }, status: :created }
      else
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = client.find(params[:id])
    respond_to do |format|
      @client.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def index
    @clients = Client.all
    respond_to do |format|
      format.json { render json: { clients: @clients }, status: :ok }
    end
  end

  def edit
    @client = client.find(params[:id])
    respond_to do |format|
      format.json { render json: { client: @client }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        format.json { render json: { client: @client }, status: :ok }
      else
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :age, :number, :branch_id)
  end
end
