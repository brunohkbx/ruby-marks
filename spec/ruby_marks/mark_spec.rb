require 'spec_helper'

describe RubyMarks::Mark do
  describe '#marked?' do
    let(:mark) { described_class.new }
    let(:intensity_percentage) { RubyMarks.intensity_percentual }

    context 'When not image_str' do
      before { allow(mark).to receive(:image_str).and_return(nil) }

      subject { mark.marked? intensity_percentage }

      it { is_expected.to be_nil }
    end

    context 'When image_str is present' do
      let(:intensity) { spy(:intensity) }

      before do
        allow(mark).to receive(:image_str).and_return(double)
        allow(mark).to receive(:intensity).and_return(intensity)
      end

      it 'checks if intensity >= intensity_percentage' do
        mark.marked? intensity_percentage

        expect(intensity).to have_received(:>=).with(intensity_percentage)
      end
    end
  end
end
