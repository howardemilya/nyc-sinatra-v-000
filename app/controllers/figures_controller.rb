class FiguresController < ApplicationController

  get '/figures' do

    erb :'figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure]["name"])
    if params[:figure]["title_ids"]
      params[:figure]["title_ids"].each do |id|
        @figure.titles << Title.find_by_id(id)
      end
    end
    if !params[:title]["name"].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end
    if params[:figure]["landmark_ids"]
      params[:figure]["landmark_ids"].each do |id|
        @figure.landmarks << Landmark.find_by_id(id)
      end
    end
    if !params[:landmark]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure]["name"]
  end
end
