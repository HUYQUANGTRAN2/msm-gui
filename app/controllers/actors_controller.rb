class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    new_actor = Actor.new
    new_actor.name = name
    new_actor.dob = dob
    new_actor.bio = bio
    new_actor.image = image
    new_actor.save
    redirect_to("/actors")
  end

  def modify
    the_id = params.fetch("path_id")
    matching_actor = Actor.where({ :id => the_id })
    the_actor = matching_actor.at(0)
    
    the_actor.name = params.fetch("query_name")
    the_actor.dob  = params.fetch("query_dob")
    the_actor.bio  = params.fetch("query_bio")
    the_actor.image= params.fetch("query_image")
    the_actor.save
  
    redirect_to("/actors/#{the_actor.id}")
  end

  def delete
    the_id = params.fetch("path_id")
    matched_actor = Actor.where({ :id => the_id })
    deleted_actor = matched_actor.at(0)
    
    deleted_actor = deleted_actor.destroy
  
    redirect_to("/actors")
  end
end
