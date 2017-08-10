class FiguresController < ApplicationController

  get '/figures/new' do
    erb:'/figures/new'
  end

  get '/figures' do
    erb:'/figures/index'
  end

  post '/figures' do
    Figure.create(params)
    erb:'figures/index'
  end

end
