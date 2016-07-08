require_relative 'player'
class Game

  RULES = {
    ROCK: { PAPER: 2, SCISSORS: 1, ROCK: 'DRAW' },
    PAPER: { SCISSORS: 2, ROCK: 1, PAPER: 'DRAW' },
    SCISSORS: { ROCK: 2, PAPER: 1, SCISSORS: 'DRAW' }
  }
  attr :player, :machine

  def self.set_game(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def initialize(player, machine=Machine)
    @player = player
    @machine = machine
  end

  def player_option
    player.weapon
  end

  def machine_option
    machine.choose_weapon
  end

  def win(p1, p2)
    p @player.name
    if self.player_option == self.machine_option
      'DRAW!'
    elsif self.player_option == "Paper"
      @player.name if self.machine_option == "Rock"
      'Machine wins!' if self.machine_option == "Scissors"
    elsif self.player_option == "Scissors"
      @player.name if self.machine_option == "Paper"
      'Machine wins!' if self.machine_option == "Rock"
    elsif self.player_option == "Rock"
      @player.name if self.machine_option == "Scissors"
      'Machine wins!' if self.machine_option == "Paper"
    end
  end
end
