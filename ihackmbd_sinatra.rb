require 'sinatra'
require 'sinatra/reloader'
require_relative 'ironhackmdb'

get '/' do
	@shows = TVShow.all
	
	erb :index
end

post '/add' do
	tv = TVShow.new
	tv.name = params[:name]
	tv.own_rating = params[:rating]
	tv.own_comments = params[:comment]
	tv.save
	redirect to('/')
end