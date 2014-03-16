require_relative '../lib/note'
require_relative '../lib/keyboard'

describe Keyboard do
  describe ".press_all" do
    subject{ described_class.press_all(*notes) }

    context 'with a single C note' do
      let(:notes){ [Note.new('C')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | ● |   |   |   |   |   |   | ● |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a single C# note' do
      let(:notes){ [Note.new('C#')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| | |  |  | | | | | |  |  |●| | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a C major chord' do
      let(:notes){ [Note.new('C'), Note.new('E'), Note.new('G')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | ● |   | ● |   | ● |   |   | ● |   | ● |   | ● |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a string as a parameter' do
      let(:notes){ ['C#'] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| | |  |  | | | | | |  |  |●| | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end
  end

  describe ".press_once" do
    subject{ described_class.press_once(*notes) }

    context 'with a single C note' do
      let(:notes){ [Note.new('C')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | ● |   |   |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a single C# note' do
      let(:notes){ [Note.new('C#')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a C major chord' do
      let(:notes){ [Note.new('C'), Note.new('E'), Note.new('G')] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | ● |   | ● |   | ● |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end

    context 'with a string as a parameter' do
      let(:notes){ ['C#'] }

      it 'renders correctly' do
        expect(subject).to eq(
  <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
        )
      end
    end
  end
end
