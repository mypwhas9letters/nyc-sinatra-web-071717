class LandmarksController < ApplicationController



  get '/landmarks/new' do
    erb:'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.all.find(params[:id])
    erb:"landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params['id'])
    @landmark.name = params['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    erb:"landmarks/show"
  end

  post '/landmarks' do
    @landmark = Landmark.new(params['landmark'])
    @landmark.name = params['landmark']['name']
    @landmark.save
    erb:'landmarks/index'
  end

  get '/landmarks' do
    erb:'/landmarks/index'
  end



end
