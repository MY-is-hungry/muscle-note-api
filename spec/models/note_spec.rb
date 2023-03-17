require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { create(:note) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :note }

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
        note.user_id = 'a'*49
        expect(note).to be_invalid
      end
    end

    context 'resource_kind' do
      let(:attribute) { :resource_kind }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
    end

    context 'resource_id' do
      let(:attribute) { :resource_id }
      include_context :presence_validation, :nil, false

      it 'resource_kindとresource_idの組み合わせがユニークでない場合に非有効であること' do
        valid_note = note
        same_note = build(:note, resource_kind: valid_note.resource_kind, resource_id: valid_note.resource_id)
        expect(same_note).to be_invalid
      end
    end
  end
end
