require 'rails_helper'

RSpec.describe Withdrawal, type: :model do
  let(:withdrawal) { Withdrawal.new(amount: 280) }

  context 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }

    context 'unavailable notes' do
      before { withdrawal.amount = 283 }

      it 'is not valid' do
        expect(withdrawal).not_to be_valid
      end

      it 'raises an error' do
        withdrawal.valid?
        expect(withdrawal.errors.full_messages).to include 'Amount can not be issued with available bankontes($100, $50, $20, $10).'
      end
    end
  end

  describe 'count_banknotes' do
    it 'keeps count of an each banknote in a hash' do
      withdrawal.count_banknotes
      expect(withdrawal.banknotes).to be_a Hash
    end

    it 'returns the lowest number of available notes' do
      withdrawal.count_banknotes
      expect(withdrawal.banknotes).to eq(100 => 2, 50 => 1, 20 => 1, 10 => 1)
    end
  end
end
