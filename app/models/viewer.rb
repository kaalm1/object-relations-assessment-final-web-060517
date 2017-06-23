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
