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
