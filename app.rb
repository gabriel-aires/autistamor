# Dependencies
require "dotenv/load"
require "sinatra"
require "hamlit"
require "sequel"
require "extralite"
require "scrypt"

# Configuration
APP_ENV = ENV['APP_ENV'] ||= 'development'
DB = Sequel.connect('extralite://data.db')
enable :sessions
set :public_folder, __dir__ + "/assets"

# Models
GLOB = "./models/*.rb"
Dir[GLOB].each { |file| require file }

# Routes
get "/" do
    haml :index
end

get "/map" do
    @passengers = Passenger.all
    haml :map
end

get "/crew" do
    @crew = Crew.all
    haml :crew
end

get "/passenger" do
    haml :create_passenger
end

post "/passenger" do
    begin
    	passenger = Passenger.create! params
    	redirect_to "/map"
    rescue Exception => e
        flash[:error] = e.message
        haml :create_passenger 
    end
end

get "/passenger/:id" do
    @passenger = Passenger[params[:id]]
    haml :passenger
end

