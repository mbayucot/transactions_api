require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:transaction_id) }
    it { is_expected.to validate_uniqueness_of(:transaction_id) }
    it { is_expected.to validate_presence_of(:points) }
    it { is_expected.to validate_numericality_of(:points).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
