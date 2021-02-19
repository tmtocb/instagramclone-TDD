require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:user_id) }
  end

  describe '#associations' do
    it { should belong_to(:user) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe '#attachments' do
    it { should have_one_attached(:image) }
  end
end
