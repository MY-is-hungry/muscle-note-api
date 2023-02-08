require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) { create(:exercise) }

  describe 'バリデーション' do
    include PresenceContext
    let(:factory) { :exercise }

    context 'name' do
      let(:attribute) { :name }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '50文字以上の場合に非有効であること' do
        exercise.name = 'あ'*51
        expect(exercise).to be_invalid
      end
    end

    context 'user_id' do
      let(:attribute) { :user_id }
      include_context :presence_validation, :nil, false
      include_context :presence_validation, :empty, false
      it '48文字以上の場合に非有効であること' do
        exercise.user_id = 'a'*49
        expect(exercise).to be_invalid
      end
    end
  end
end