class WithdrawalsController < ApplicationController
  def show
    @withdrawal = Withdrawal.new(amount: params[:amount])
    @withdrawal.count_banknotes if @withdrawal.valid?
    render json: @withdrawal.to_json
  end
end
