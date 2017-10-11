require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
  configure { register WillPaginate::Sinatra }
  set :method_override, true

  get '/' do
    erb :index
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :'/stations/dashboard'
  end

  get '/stations' do
    @stations = Station.paginate(page: params[:page], per_page: 30)
    erb :'/stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'/stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'/stations/show'
  end

  post '/stations' do
    params[:station][:installation_date] = Station.format_date(params)
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @cities  = City.all
    @station = Station.find(params[:id])
    erb :'/stations/edit'
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/trips' do
    @paginated = Trip.paginate(page: params[:page], per_page: 30)
    erb :'/trips/index'
  end

  get '/trips-dashboard' do
    @cool_variable = ['stuff', 'and', 'things']
    erb :'trips/dashboard'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:id])
    erb :'/trips/show'
  end

  post '/trips' do
    Trip.create(params[:trip])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  put '/trips' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect "/trips"
  end

  get '/weather-dashboard' do
    @condition = Condition.all
    erb :'/condition/dashboard'
  end

  get '/conditions' do
    @paginated = Condition.paginate(page: params[:page], per_page: 30)
    erb :'/conditions/index'
  end

  get '/conditions/new' do
    erb :'/conditions/new'
  end

  get '/conditions/:id' do
    @conditions = Condition.find(params[:id])
    erb :'/conditions/show'
  end

  post '/conditions' do
    Condition.create(params[:condition])
    redirect "/conditions"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :'/conditions/edit'
  end

  put '/conditions' do |id|
    Condition.update(id.to_i, params[:condition])
    redirect "/conditions/#{id}"
  end

  delete '/conditions/:id' do |id|
    Condition.destroy(id.to_i)
    redirect "/conditions"
  end
end
