class FiguresController < ApplicationController

  get '/' do
    erb:'/index'
  end

  get '/figures/new' do
    erb:'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params['id'])
    erb:"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params['id'])
    @figure.landmarks << Landmark.find_or_create_by(name: params['new_landmark'])
    @figure.name = params['figure_name']
    @figure.save
    redirect "/figures/#{@figure.id}"

  end

  # post '/' do
  #   Figure.find_by(params['name'])
  #   erb:""
  # end

  get '/figures/:id' do
    @fig = Figure.find(params['id'])
    erb:"/figures/show"
  end

  get '/figures' do
    erb:'/figures/index'
  end

  post '/figures' do
    @fig = Figure.new(params['figure'])
    # @fig.name = params['figure']['name']
    # @fig.save

    @title = Title.new(params['title'])
    @fig.titles << @title
    @title.save

    @landmark = Landmark.new(params['landmark'])
    @fig.landmarks << @landmark
    @landmark.save


    @fig.save

    erb:'/figures/index'
  end

end
