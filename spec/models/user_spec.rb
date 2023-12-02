# user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
end
