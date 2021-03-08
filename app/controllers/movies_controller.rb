class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # Using Postgres Search without gem
      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.synopsis @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # Using pg_search without join querying
      # @movies = Movie.search_by_title_and_synopsis(params[:query])

      # Using pg_search with join querying (with associations)
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
