require 'sinatra'
require_relative 'config/application'
require_relative 'app/models/starship'
require_relative 'app/models/crewmember'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.
  @starships = Starship.all
  erb :'starships/index'
end


get '/starships/new' do
  erb :'/starships/new'
end

post '/starships' do
  name = params[:name]
  ship_class = params[:ship_class]
  location = params[:location]
  new_ship = Starship.new(
    name: params["name"],
    ship_class: params["ship_class"],
    location: params["location"]
  )
  if new_ship.save
    flash[:notice] = "You have successfully made a new ship!"
    redirect "/starships/#{new_ship.id}"
  else
    flash[:notice] = new_ship.errors.full_messages.to_sentence
    redirect "/starships/new"
  end
  @new_ship = Ship.find_by(name: params["name"])
end

get '/starships/:id' do

  @starship = Starship.find(params["id"])
  @crew_member = CrewMember.where

  erb :'/starships/show'
end

get '/crew-members' do
  @crew_members = CrewMember.order(:last_name)
  erb :'/crew-members/index'
end

post '/starships/:id' do
  page = params[:id]
  first_name = params[:first_name]
  last_name = params[:last_name]
  specialty_division = params[:specialty_division]
  @starship = Starship.find(params["id"])

  new_crew = CrewMember.new(
    first_name: params["first_name"],
    last_name: params["last_name"],
    specialty_division: params["specialty_division"],
    starship_id: params["id"]
  )


  if new_crew.save
    flash[:notice] = "You have successfully made a new pilot!"
    redirect "/crew-members"
  else
    flash[:notice] = new_crew.errors.full_messages.to_sentence
    redirect "/starships/#{page}"
  end
end
