# frozen_string_literal: true

class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @card = Card.new
    respond_to do |format|
      format.json { render json: { card: @card }, status: :ok }
    end
  end

  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.json { render json: { card: @card }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.json { render json: { card: @card }, status: :created }
      else
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card = Card.find(params[:id])
    respond_to do |format|
      @card.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def index
    @cards = Card.all
    respond_to do |format|
      format.json { render json: { cards: @cards }, status: :ok }
    end
  end

  def edit
    @card = Card.find(params[:id])
    respond_to do |format|
      format.json { render json: { card: @card }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    @card = Card.find(params[:id])
    respond_to do |format|
      if @card.update(card_params)
        format.json { render json: { card: @card }, status: :ok }
      else
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def card_params
    params.require(:card).permit(:card_type, :number, :account_id)
  end
end
