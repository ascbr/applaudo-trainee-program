require 'refactoring_example'
require 'answer'

describe 'CorrectAnswerBehavior' do
  describe 'was_correctly_answered' do
    context 'given a correct answer ' do
      it 'Answer not nil' do
        behavior = CorrectAnswerBehavior.new
        expect(behavior.answer).to_not be nil
      end

      it "does not teturn 'nil'" do
        behavior = CorrectAnswerBehavior.new
        expect(behavior.was_correctly_answered).to_not be nil
      end

      it "returns 'true'" do
        behavior = CorrectAnswerBehavior.new
        expect(behavior.was_correctly_answered).to eq(true)
      end

      it 'in_penalty_box is a boolean' do
        behavior = CorrectAnswerBehavior.new
        expect([true, false]).to include(behavior.answer.in_penalty_box)
      end
    end
  end
end

describe 'CorrectAnswerBehavior' do
  describe 'was_correctly_answered' do
    context 'given a correct answer ' do
      it 'getting_out_penalty_box is a boolean' do
        behavior = CorrectAnswerBehavior.new
        expect([true, false]).to include(behavior.answer.getting_out_penalty_box)
      end

      it 'current_player between 0 and 2' do
        behavior = CorrectAnswerBehavior.new
        expect((0..(behavior.players.length - 1)).to_a).to include(behavior.answer.current_player)
      end

      it 'current_player in players' do
        behavior = CorrectAnswerBehavior.new
        expect(behavior.players).to include(behavior.answer.current_player_name)
      end

      it 'purse between 2 and 5' do
        behavior = CorrectAnswerBehavior.new
        expect((2..5).to_a).to include(behavior.answer.purse)
      end
    end
  end
end
