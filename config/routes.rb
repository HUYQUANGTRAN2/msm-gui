Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director",{ :controller => "directors", :action => "add" })
  post("/modify_director/:path_id",{ :controller => "directors", :action => "modify"})
  get("/delete_director/:path_id",{ :controller => "directors", :action => "delete"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie",{ :controller => "movies", :action => "add" })
  post("/modify_movie/:path_id",{ :controller => "movies", :action => "modify"})
  get("/delete_movie/:path_id",{ :controller => "movies", :action => "delete"})

  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor",{ :controller => "actors", :action => "add" })
  post("/modify_actor/:path_id",{ :controller => "actors", :action => "modify"})
  get("/delete_actor/:path_id",{ :controller => "actors", :action => "delete"})
end
