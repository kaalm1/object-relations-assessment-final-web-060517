# Please copy/paste all three classes into this file to submit your solution!
class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find do |movie|
      movie.title == title
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    Rating.all.map do |rating|
      rating.viewer
    end
  end

  def average_rating
    total = self.ratings.inject(0) do |sum,rating|
      sum + rating.score
    end
    (1.0*total/self.ratings.length).round(2)
  end

end


class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize(viewer,movie,score)
    @viewer = viewer
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

end

class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.find do |viewer|
      viewer.full_name == name
    end
  end

  def create_rating(movie_title,score)
    Rating.new(self,Movie.find_by_title(movie_title),score)
  end

end
