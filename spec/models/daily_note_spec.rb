require 'rails_helper'

RSpec.describe DailyNote, type: :model do
  let(:daily_note) { create(:daily_note) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :daily_note }

    context 'content' do
      let(:attribute) { :content }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
    end

    context 'user_id' do
      let(:attribute) { :user_id }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '48文字以上の場合に非有効であること' do
        daily_note.user_id = 'a'*49
        expect(daily_note).to be_invalid
      end
    end

    context 'recorded_on' do
      let(:attribute) { :recorded_on }
      include_context :presence_validation, :nil, false
      it 'user_idとrecorded_onの組み合わせがユニークでない場合に非有効であること' do
        valid_daily_note = daily_note
        same_daily_note = build(:daily_note, user_id: valid_daily_note.user_id, recorded_on: valid_daily_note.recorded_on)
        expect(same_daily_note).to be_invalid
      end
    end
  end
end
