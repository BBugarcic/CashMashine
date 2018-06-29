class Withdrawal
  include ActiveModel::Model

  attr_accessor :amount, :banknotes

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :notes_availability, unless: proc { |withdrawal| (withdrawal.amount.to_i % 10).zero? }

  AVAILABLE_NOTES = [100, 50, 20, 10].freeze

  def count_banknotes
    self.banknotes = {}
    current_amount = amount.to_i
    AVAILABLE_NOTES.each do |note|
      count = current_amount / note
      current_amount = current_amount % note
      banknotes[note] = count
    end
  end

  private

  def notes_availability
    errors.add(
      :amount, 'can not be issued with available bankontes($100, $50, $20, $10).'
    )
  end
end