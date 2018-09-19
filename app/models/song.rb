class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    binding.pry
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Song.all.select do |song|
      song.slug == slug
    end[0]
  end
end
