require 'refactoring_example'

describe 'CorrectAnswerBehavior' do
  describe 'was_correctly_answered' do
    context 'given a correct answer ' do
      it "returns 'ture'" do
        answer = CorrectAnswerBehavior.new
        expect(answer.was_correctly_answered).to eq(true)
      end

      it 'in_penalty_box is a boolean' do
        answer = CorrectAnswerBehavior.new
        expect([true, false]).to include(answer.in_penalty_box[answer.current_player])
      end
    end
  end
end
