class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end   

  def add
    title = params.fetch("query_title")
    year = params.fetch("query_year")
    duration = params.fetch("query_duration")
    description = params.fetch("query_description")
    image = params.fetch("query_image")
    director_id = params.fetch("query_director_id")

    matching_directors = Director.where({ :id => director_id })
    the_director       = matching_directors.at(0)

    if the_director
      new_movie = Movie.new
      new_movie.title       = title
      new_movie.year        = year
      new_movie.duration    = duration
      new_movie.description = description
      new_movie.image       = image
      new_movie.director_id = director_id
      new_movie.save
    end
  end

  def modify
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    director_id = 

    if the_director
      the_director.name = params.fetch("query_name")
      the_director.dob  = params.fetch("query_dob")
      the_director.bio  = params.fetch("query_bio")
      the_director.image= params.fetch("query_image")
      the_director.save
    end 
  
    redirect_to("/directors/#{the_director.id}")
  end
end
