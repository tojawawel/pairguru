require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'database columns' do
    it {should have_db_column :body}
    it {should have_db_column :user_id}
    it {should have_db_column :movie_id}
  end

  describe 'associations' do
    it {should belong_to(:user)}
    it {should belong_to(:movie)}
  end

  describe 'validations' do
    it {should validate_presence_of(:body)}
    # it {should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }
  end
end
