module PresenceExample
  # Setup
  # let(:factory) { ex. :category }
  # let(:attribute) { ex. :name }
  # let(:expected) { boolean }
  # let(:type) { :empty or :nil }

  RSpec.shared_examples :presence_example do
    it :validate_presense do
      actual = build(factory, attribute => (type == :nil ? nil : ''))

      if expected
        expect(actual).to be_valid
      else
        expect(actual).to be_invalid
      end
    end
  end
end