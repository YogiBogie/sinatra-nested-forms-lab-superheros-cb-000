require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])
      @test = params[:team]

      params[:team][:member].each do |a|
        Hero.new(a)
      end
      @heroes = Hero.all
      erb :team
    end

end
