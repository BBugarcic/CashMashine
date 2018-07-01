class Withdrawal
  include ActiveModel::Model

  attr_accessor :amount, :banknotes

  validates :amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
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
    self.banknotes = banknotes.delete_if{ |_, count| count.zero? }
  end

  private

  def notes_availability
    errors.add(
      :amount, 'must be issued in multiples of $10.'
    )
  end
end