require 'sinatra/base'
require './lib/machine'
require './lib/player'
require './lib/game'

class RPS < Sinatra::Base
 enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:game] = Game.set_game(Player.new(params[:name]),  Machine.new)
    redirect '/play'
  end

  get '/play' do
    @game = session[:game]
    erb :play
  end

  before do
    @game = session[:game]
  end

  post '/weapon' do
    session[:player] = @game.player.selected_weapon(params[:weapon])
    redirect '/weapon'
  end

  get '/weapon' do
    @weapon = session[:player]
    erb :'/weapon'
  end

  get '/AI' do
    session[:machine] = @game.machine_option
    erb :'/AI'
  end

  get '/result' do
    p session[:machine].to_s
    p session[:player]
    p @winner = @game.win(session[:player], session[:machine].to_s)
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
