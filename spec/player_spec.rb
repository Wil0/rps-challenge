require 'player'

describe Player do
  let(:player) { described_class.new('Player') }

  it 'returns the player name' do
    expect(player.name).to eq 'Player'
  end

  it 'returns player selected weapon' do
    weapon = :ROCK
    player.selected_weapon(weapon)
    expect(player.weapon).to eq :ROCK
  end

end
