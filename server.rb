require 'sinatra'
require 'httparty'

get "/" do
  redirect "/catfacts"
end

get '/catfacts' do

  response = HTTParty.get('http://catfacts-api.appspot.com/api/facts')
  cat_response = JSON.parse(response)
  cat_facts = cat_response["facts"][0]
  erb :index, locals: { cat_facts: cat_facts }
end
