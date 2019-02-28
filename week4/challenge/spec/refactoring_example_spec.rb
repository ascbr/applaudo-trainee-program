require 'refactoring_example'
require 'answer'

describe 'CorrectAnswerBehavior' do
  describe 'was_correctly_answered' do
    context 'given a correct answer ' do
      behavor = CorrectAnswerBehavior.new
      it "returns 'true'" do
        expect(behavor.was_correctly_answered).to eq(true)
      end

      it 'in_penalty_box is a boolean' do
        expect([true, false]).to include(behavor.answer.in_penalty_box)
      end

      it 'current_player between 0 and 2' do
        expect((0..(behavor.players.length - 1)).to_a).to include(behavor.answer.current_player)
      end

      it 'current_player in players' do
        expect(behavor.players).to include(behavor.answer.current_player_name)
      end

      it 'purse between 2 and 5' do
        expect((2..5).to_a).to include(behavor.answer.purse)
      end

    end
  end
end
