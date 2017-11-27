class EatcoinsController < ApplicationController
  before_action :set_eatcoin, only: [:show, :edit, :update, :destroy]

  # GET /eatcoins
  # GET /eatcoins.json
  def index
    @eatcoins = Eatcoin.all
  end

  # GET /eatcoins/1
  # GET /eatcoins/1.json
  def show
  end

  # GET /eatcoins/new
  def new
    @eatcoin = Eatcoin.new
  end

  # GET /eatcoins/1/edit
  def edit
  end

  # POST /eatcoins
  # POST /eatcoins.json
  def create
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = 'dygrq6dx9pwjybmx'
    Braintree::Configuration.public_key = 'qpk2hw9f73s5drq8'
    Braintree::Configuration.private_key = 'c6c2da7390488c4a76859d4d1a1dd16e'
    @eatcoin = Eatcoin.new(eatcoin_params)
    nonce_from_the_client = 'fake-valid-nonce'
    result = Braintree::Transaction.sale(
      :amount => @eatcoin.amount,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success?
      respond_to do |format|
        if @eatcoin.save
          puts "success!: #{result.transaction.id}"
          format.html { redirect_to @eatcoin, notice: 'Eatcoin was successfully created.' }
          format.json { render :show, status: :created, location: @eatcoin }
        else
          format.html { render :new }
          format.json { render json: @eatcoin.errors, status: :unprocessable_entity }
        end
      end
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
    else
      p result.errors
    end
  end

  # PATCH/PUT /eatcoins/1
  # PATCH/PUT /eatcoins/1.json
  def update
    respond_to do |format|
      if @eatcoin.update(eatcoin_params)
        format.html { redirect_to @eatcoin, notice: 'Eatcoin was successfully updated.' }
        format.json { render :show, status: :ok, location: @eatcoin }
      else
        format.html { render :edit }
        format.json { render json: @eatcoin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eatcoins/1
  # DELETE /eatcoins/1.json
  def destroy
    @eatcoin.destroy
    respond_to do |format|
      format.html { redirect_to eatcoins_url, notice: 'Eatcoin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eatcoin
      @eatcoin = Eatcoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eatcoin_params
      params.require(:eatcoin).permit(:amount)
    end
end
