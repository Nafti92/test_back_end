class Api::V1::ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render json: {status: "SUCCESS", message: "Loaded appartment", data: @listings}, status: :ok
  end

  def show
    @listing = Listing.find(params[:id])
    render json: {status: "SUCCESS", message: "Loaded appartment", data: @listing}, status: :ok
  end

  def new
    @listing = Listing.new
    render json: {status: "SUCCESS", message: "Loaded appartment", data: @listing}, status: :ok
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: {status: 'SUCCESS', message: 'Listing is saved', data:@listing}, status: :ok
    else
      render json: {status: 'Error', message: 'Listing is not saved', data:@listing.errors}, status: :unprocessable_entity
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      render json: {status: 'SUCCESS', message: 'Listing is updated', data:@listing}, status: :ok
    else
      render json: {status: 'Error', message: 'Listing is not updated', data:@listing.errors}, status: :unprocessable_entity
    end
  end

  def delete
    Listing.find(params[:id]).destroy
    render json: {status: 'SUCCESS', message: 'Listing successfully deleted', data:@listing}, status: :ok
  end

  private

  def listing_params
    params.require(:listings).permit(:num_rooms)
  end
end
