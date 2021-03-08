class Movie < ApplicationRecord
  belongs_to :director

  searchkick

  include PgSearch::Model

  multisearchable against: [:title, :synopsis]

  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :global_search,
    against: [ :title, :synopsis ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

# a module is actually a class, with some small differences
# 1st difference: you can't instantiate a module, so, you can't create a new instance of it
# 2nd difference: you can include a module inside a Class, so that the Class inheritas all the behavior

# For future reference, look for modules and/or concerns (modules for models)

# module Enumerable
#   def count
#   end

#   def size
#   end

#   def map
#   end

#   def each
#   end

#   def each_with_index
#   end
# end

# class Array
#   include Enumerable
# end

# class Hash
#   include Enumerable
# end