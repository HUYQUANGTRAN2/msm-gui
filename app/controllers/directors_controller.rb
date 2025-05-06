class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def add
    name = params.fetch("query_name")
    dob = params.fetch("query_dob")
    bio = params.fetch("query_bio")
    image = params.fetch("query_image")
    new_director = Director.new
    new_director.name = name
    new_director.dob = dob
    new_director.bio = bio
    new_director.image = image
    new_director.save
    redirect_to("/directors")
  end

  def modify
    the_id = params.fetch("path_id")
    matching_directors = Director.where({ :id => the_id })
    the_director = matching_directors.at(0)
    
    the_director.name = params.fetch("query_name")
    the_director.dob  = params.fetch("query_dob")
    the_director.bio  = params.fetch("query_bio")
    the_director.image= params.fetch("query_image")
    the_director.save
  
    redirect_to("/directors/#{the_director.id}")
  end

  def delete
    the_id = params.fetch("path_id")
    matched_directors = Director.where({ :id => the_id })
    deleted_director = matched_directors.at(0)
    
    deleted_director = deleted_director.destroy
  
    redirect_to("/directors")
  end
end
