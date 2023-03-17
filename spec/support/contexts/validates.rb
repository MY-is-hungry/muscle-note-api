module PresenceContext
  # type: :nil or :empty
  # expected: boolean
  RSpec.shared_context :presence_validation do |type, expected|
    let(:actual) { build(factory, attribute => value) }
    let(:value) { type == :nil ? nil : '' }
    it ((type == :nil ? 'nil' : 'empty') + 'の場合に' + (expected ? '有効であること' : '非有効であること')) do
      expect(actual).to (expected ? be_valid : be_invalid)
    end
  end
end