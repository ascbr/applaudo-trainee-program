# Class Answer
class Answer
  attr_accessor :current_player,
                :purse,
                :in_penalty_box,
                :getting_out_penalty_box,
                :current_player_name

  def initialize(current_player, purse, in_penalty_box, getting_out_penalty_box, current_player_name)
    @current_player = current_player
    @purse = purse
    @in_penalty_box = in_penalty_box
    @getting_out_penalty_box = getting_out_penalty_box
    @current_player_name = current_player_name
  end
end
