class Quote

  attr_accessor :text, :favorite, :author

  @@all = []

  def initialize(text, author)
    @text = text
    @author = author
    @favorite = false
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_author(author)
    results = all.select {|q| q.author.name == author}
    results.collect {|q| q.text}
  end

  def make_favorite
    @favorite = true
    "Added Quote to My Favorites"
  end

  def unfavorite
    @favorite = false
    "Removed Quote from My Favorites"
  end

  def self.favorites
    results = all.select {|q| q.favorite == true}
    results.collect {|q| q.text}
  end

end