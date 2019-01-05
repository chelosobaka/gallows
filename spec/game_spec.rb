require 'rspec'
require 'game_controller'

describe 'game controller' do
  it 'wins the game' do
    game = GameController.new('отлизать')

    game.processing_letter('о')
    game.processing_letter('ь')
    game.processing_letter('л')
    game.processing_letter('и')
    game.processing_letter('з')
    game.processing_letter('т')
    expect(game.game_status).to eq :won
  end

  it 'lose the game' do
    game = GameController.new('слово')
    game.processing_letter('й')
    game.processing_letter('ц')
    game.processing_letter('а')
    game.processing_letter('р')
    game.processing_letter('д')
    game.processing_letter('м')
    game.processing_letter('т')

    expect(game.errors).to eq 7
    expect(game.game_status).to eq :lose
  end

  it 'repit letter' do
    game = GameController.new('слово')
    game.processing_letter('c')
    game.processing_letter('c')
    expect(game.game_status).to eq :repeat
  end

  it 'good_letter?' do
    game = GameController.new('ежовый')
    expect(game.good_letter?('ё')).to eq true

    game = GameController.new('йод')
    expect(game.good_letter?('и')).to eq true

    game = GameController.new('ёжик')
    expect(game.good_letter?('е')).to eq true

    game = GameController.new('игла')
    expect(game.good_letter?('й')).to eq true

    game = GameController.new('игла')
    expect(game.good_letter?('г')).to eq true
    expect(game.good_letter?('ж')).to eq false
  end

end
