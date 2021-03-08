class TvShow < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end


# Polymorphism!!!!
# Movies (id, title, ...)
# TvShows (id, title, ...)
# Anime (id, title, ...)
# Post (id, title, content, ...)

# MovieReview (id, movie_id, user_id, description, stars)
# TvShowReview (id, tv_show_id, user_id, description, stars)
# AnimeReview (id, anime_id, user_id, description, stars)
# PostReview (id, post_id, user_id, description, stars)


# Review (id, user_id, description, stars, record_type, record_id)

# record_type: "Movies", record_id: 5
# record_type: "Posts", record_id: 15