# spec/magic_ball_spec.rb
require  'magic_ball'
describe MagicBall do
  describe '#ask' do
    context "given 'Is Minitest awesome?'" do
      it 'returns answer' do
        magic_ball = MagicBall.new
        expect(MagicBall::ANSWERS).to include(magic_ball.ask('Is Minitest awesome?'))
      end
    end
    context 'Check kind of answer' do
      it 'is Array?' do
        expect(MagicBall::ANSWERS).to be_a_kind_of(Array)
      end
    end

    context 'Check answers array' do
      it 'is empty?' do
      expect(MagicBall::ANSWERS).not_to be_empty
      end
    end

    context "given a number '1'" do
      it 'returns an error' do
        magic_ball = MagicBall.new
        expect { magic_ball.ask(1) }.to raise_error(RuntimeError)
      end
    end
  end
end
