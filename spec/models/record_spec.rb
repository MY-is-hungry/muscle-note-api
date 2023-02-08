require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record) { create(:record) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :record }

    context 'executed_on' do
      let(:attribute) { :executed_on }
      include_context :presence_validation, :nil, false
    end

    context 'user_id' do
      let(:attribute) { :user_id }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '48文字以上の場合に非有効であること' do
        record.user_id = 'a'*49
        expect(record).to be_invalid
      end
    end

    context 'weight' do
      let(:attribute) { :weight }
      include_context :presence_validation, :nil, true
    end

    context 'rep' do
      let(:attribute) { :rep }
      include_context :presence_validation, :nil, true
    end
  end
end
