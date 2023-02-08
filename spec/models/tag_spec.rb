require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { create(:tag) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :tag }

    context 'name' do
      let(:attribute) { :name }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
    end

    context 'user_id' do
      let(:attribute) { :user_id }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '48文字以上の場合に非有効であること' do
        tag.user_id = 'a'*49
        expect(tag).to be_invalid
      end
    end
  end
end
