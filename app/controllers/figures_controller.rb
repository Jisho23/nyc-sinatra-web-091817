class FiguresController < ApplicationController
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :"/figures/new"
  end

  post '/figures' do
    new_figure = Figure.create(params[:figure])
    binding.pry
    # new_figure.name = params[:figure][:name]
    # new_figure.landmark_ids << params[:figure][:landmark_ids]
    # new_figure.title_ids << params[:figure][:title_ids]
    if params[:title][:name] != nil
      new_title = Title.create(params[:title])
      new_figure.titles << new_title

      # binding.pry
    end
    if params[:landmark][:name] != nil
      new_landmark = Landmark.create(params[:landmark])
      new_figure.landmarks << new_landmark
    end
    binding.pry
    new_figure.save
  end

end
