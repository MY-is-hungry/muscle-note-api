require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :category }

    context 'name' do
      let(:attribute) { :name }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '30文字以上の場合に非有効であること' do
        category.name = 'あ'*31
        expect(category).to be_invalid
      end
    end

    context 'user_id' do
      let(:attribute) { :user_id }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '48文字以上の場合に非有効であること' do
        category.user_id = 'a'*49
        expect(category).to be_invalid
      end
    end
  end
end
