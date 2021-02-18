require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
    it { is_expected.to have_db_column(:username) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:website) }
    it { is_expected.to have_db_column(:bio) }
    it { is_expected.to have_db_column(:phone) }
    it { is_expected.to have_db_column(:gender) }
  end

  describe '#associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end
end
