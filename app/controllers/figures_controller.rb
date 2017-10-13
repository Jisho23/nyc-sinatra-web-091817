class FiguresController < ApplicationController
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :"/figures/new"
  end

  post '/figures' do
    new_figure = Figure.create(params[:figure])
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
    new_figure.save
    redirect to "/figures/#{new_figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"

  end

end
