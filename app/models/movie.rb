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
