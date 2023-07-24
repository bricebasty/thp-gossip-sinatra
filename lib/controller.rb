# frozen_string_literal: true

require_relative 'gossip'
require_relative 'comment'

# Controls the app
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end
  # Créer un nouveau gossip
  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  # Supprimer un gossip
  get '/gossips/delete' do
    erb :delete_gossip, locals: { gossips: Gossip.all }
  end

  post '/gossips/delete' do
    id = params[:id].to_i
    Gossip.delete_self(id)
    redirect '/'
  end

  # Voir un Gossip existant
  get '/gossips/:id' do
    erb :show, locals: { gossips: Gossip.all, comments: Comment.all, id: params[:id].to_i }
  end

  # Editer un Gossip existant
  get '/gossips/:id/edit' do
    erb :edit, locals: { id: params[:id].to_i }
  end

  post '/gossips/:id/edit' do
    id = params[:id].to_i
    Gossip.update(id - 1, params['gossip_content'])
    redirect "/gossips/#{id}"
  end

  # Faire un nouveau commentaire
  post '/gossips/:id/comment/new' do
    id = params[:id].to_i
    Comment.new(params['comment_author'], params['comment_content'], id).save
    redirect "/gossips/#{id}"
  end
end
