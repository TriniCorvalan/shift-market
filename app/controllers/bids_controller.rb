class BidsController < ApplicationController
  before_action :set_bid, only: %i[ show edit update destroy ]

  # GET /bids or /bids.json
  def index
    @bids = current_user.bids
  end

  def accept
    @bid = Bid.find(params[:bid_id])
    @auction = @bid.auction
    shift_1 = @auction.shift
    user_1 = shift_1.user_id
    shift_2 = @bid.shift
    user_2 = shift_2.user_id
    shift_1.update(user_id: user_2)
    shift_2.update(user_id: user_1)
    redirect_to auctions_path, notice: "Cambio realizado"
  end
  # # GET /bids/1 or /bids/1.json
  # def show
  # end

  # GET auctions/:id/bids/new
  def new
    @shifts = current_user.shifts.options_for_select
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.build
  end

  # # GET /bids/1/edit
  # def edit
  # end

  # POST /bids or /bids.json
  def create
    @bid =  Bid.new(bid_params)
    @bid.bidder_id = current_user.id

    respond_to do |format|
      if @bid.save
        format.html { redirect_to bid_url(@bid), notice: "Bid was successfully created." }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /bids/1 or /bids/1.json
  # def update
  #   respond_to do |format|
  #     if @bid.update(bid_params)
  #       format.html { redirect_to bid_url(@bid), notice: "Bid was successfully updated." }
  #       format.json { render :show, status: :ok, location: @bid }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @bid.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /bids/1 or /bids/1.json
  # def destroy
  #   @bid.destroy

  #   respond_to do |format|
  #     format.html { redirect_to bids_url, notice: "Bid was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bid_params
      params.require(:bid).permit(:auction_id, :shift_id, :bidder_id, :status, :price, :description)
    end
end
