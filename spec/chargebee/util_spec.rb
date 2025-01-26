require 'spec_helper'

RSpec.describe ChargeBee::Util do
  describe '#serialize' do
    subject(:serilize) { described_class.serialize(value, nil) }

    let(:value) do
      {
        id: 'COUPON-SPECIFIC-ITEM-1',
        name: 'COUPON-SPECIFIC-ITEM-1',
        discount_percentage: 50.746269,
        discount_type: 'PERCENTAGE',
        duration_type: 'limited_period',
        period_unit: 'year',
        period: 1,
        apply_on: 'EACH_SPECIFIED_ITEM',
        item_constraints: [
          {
            constraint: 'specific',
            item_type: 'PLAN',
            item_price_ids: %w[Learn-Premium-USD-Yearly]
          }
        ]
      }
    end
    let(:expected_response) do
      {
        'id' => 'COUPON-SPECIFIC-ITEM-1',
        'name' => 'COUPON-SPECIFIC-ITEM-1',
        'discount_percentage' => '50.746269',
        'discount_type' => 'PERCENTAGE',
        'duration_type' => 'limited_period',
        'period_unit' => 'year',
        'period' => '1',
        'apply_on' => 'EACH_SPECIFIED_ITEM',
        'item_constraints[0][constraint]' => 'specific',
        'item_constraints[0][item_type]' => 'PLAN',
        'item_constraints[0][item_price_ids][0]' => 'Learn-Premium-USD-Yearly'
      }
    end

    it { is_expected.to eq(expected_response) }
  end
end
