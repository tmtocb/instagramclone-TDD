require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:user_id) }
  end

  describe '#associations' do
    it { should belong_to(:user) }
  end
end
