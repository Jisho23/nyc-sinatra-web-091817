class LandmarksController < ApplicationController

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all

    erb :"/landmarks/new"
  end

  post '/landmarks' do
    new_landmark = Landmark.create(params[:landmark])
    # new_figure.name = params[:figure][:name]
    # new_figure.landmark_ids << params[:figure][:landmark_ids]
    # new_figure.title_ids << params[:figure][:title_ids]

      # binding.pry
    new_landmark.save
    redirect to "/landmarks/#{new_landmark.id}"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end


end
