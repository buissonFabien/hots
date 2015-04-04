require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'mongo'
require 'json/ext'
require 'json'
# require 'uri'

include Mongo


before do
   content_type :json
   headers 'Access-Control-Allow-Origin'  => '*', 
         'Access-Control-Allow-Methods' => ['GET', 'POST', 'PUT', 'DELETE','OPTIONS'],
         'Access-Control-Allow-Headers' => 'accept, origin, Content-Type : json'
end

def get_connection
  puts "ok"
  
  return @db_connection if @db_connection
  db = URI.parse('mongodb://fabHots:tamere1234@ds031601.mongolab.com:31601/')
  db_name = 'heroku_app35238099'
  # db_name = db.path.gsub(/^\//, '')
  @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
  @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
  @db_connection
  
end


db = get_connection
collections = @db.collection_names
puts collections
# last_collection = collections[-1]
# coll = @db.collection(last_collection)


# def get_connection
#   return @db_connection if @db_connection
#   db = URI.parse(ENV['MONGOHQ_URL'])
#   db_name = db.path.gsub(/^\//, '')
#   @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
#   @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.password.nil?)
#   @db_connection
# end

# db = get_connection



# collections = db.collection_names
# puts collections
# last_collection = collections[-1]
# coll = db.collection(last_collection)



get '/getData' do
  # db = get_connection
# # puts db
  "learning ruby"
end


























# ######################GET########################
# #
# #Passer la clefs en params pour récupérer uniquement la partie de la bdd du client concerné
# # get '/getData' do	
# # 	@connection = Mongo::Connection.new
# # 	url = request.query_string
# # 	url2 = url.split('=')
# # 	urlFinal = url2[1].gsub!("%2F", "/")
# # 	urlFinal = url2[1].gsub!("%23", "#")
# # 	puts urlFinal 
# # 	# ""
# # 	# "https://dev2.easiware.fr/7.2/easicrm.5.0.dev"
# # 	@db = @connection.db('bddKB')
# # 	@coll = @db.collection('bddKB')
# # 	@kb = @coll.find({'key' => ""}).to_a.to_json
# # end

# get '/getData' do

# 	db = get_connection
# 	collections = db.collection_names
# 	puts collections
# 	data = coll.find().to_a.to_json
# end


# # ######################POST#######################

# ###############################################################################
# # Ajout d'articles
# # Format pour le /post :  {
# #   "key": "",
# #   "articles" : [
# #       {
# #         "id" : "",
# #         "title" : "",
# #         "categorie" : "",
# #         "answer"  : "",
# #         "rate"    : "",
# #         "nbViews" : "",
# #         "popular": ""
# #       }
# #     ]
# # # }
# # post '/post' do
# # 	corp = request.body.string

# # 	db = get_connection
	 
# # 	puts "Collections"
# # 	puts "==========="
# # 	collections = db.collection_names

# # 	topObject = JSON.parse(corp)
# # 	key = topObject["Fiterd"]
# # 	# articles = topObject["articles"]

# # 	$i=0
# # 	begin
# #    		stats = Fiterd [$i]

# # 		@hero	  	  = stats['hero']
# # 		@title	  = stats['map']
# # 		@categorie = stats['result']
# # 		@answer   = stats['kill']

# # 		@rate     = stats['death']
# # 		@nbViews = stats['exp']
# # 		@popular = stats['obj']

# # 		coll.update({ key: key },{ "$push" => {'value.articles' =>
# # 			{ id: @id, title: @title, categorie: @categorie, answer: @answer, rate: @rate, nbViews: @nbViews, popular: @popular }}})

# # 	   	$i += 1
# # 	end while $i <= articles.length

# # end



# ###############################################################################
# # post '/test' do
# # 	corp = request.body.string
# # 	puts "post recu:"+corp
# # end


# # #################################################
# # ######################PUT########################
# # #################################################

# ###############################################################################
# # Modification d'une fiche
# # format:  {
# #   "key": "key",
# #   "articles" : [
# #       {
# #         "id" : "idArticle a modifier",
# #         "title" : "",
# #         "categorie" : "",
# #         "answer"  : "",
# #         "rate"    : "",
# #         "nbViews" : "",
# #         "popular": ""
# #       }
# #     ]
# # }
# # post '/put' do
# # 	corp = request.body.string

# # 	db = get_connection
	 
# # 	puts "Collections"
# # 	puts "==========="
# # 	collections = db.collection_names
# # 	puts collections

# # 	topObject = JSON.parse(corp)
# # 	key = topObject["key"]
# # 	articles = topObject["articles"]
# # 	$i=0
# # 	begin
# # 		art = articles [$i]

# # 		@id	  	  = art['id']
# # 		@title	  = art['title']
# # 		@categorie = art['categorie']
# # 		@answer   = art['answer']
# # 		@rate     = art['rate']
# # 		@nbViews = art['nbViews']
# # 		@popular = art['popular']

# # 		coll.update({ "key" => key, "value.articles.id" => @id},
# # 			 {"$set" => {"value.articles.$.title" => @title,
# # 			 			 "value.articles.$.categorie" => @categorie,
# # 			 			 "value.articles.$.answer" => @answer,
# # 			 			 "value.articles.$.rate" => @rate,
# # 			 			 "value.articles.$.nbViews" =>  @nbViews,
# # 			 			 "value.articles.$.popular" =>  @popular} })
# # 	   	$i += 1
# # 	end while $i > articles.length
# # end