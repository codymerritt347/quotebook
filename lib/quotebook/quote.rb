class Quote

  attr_accessor :text, :favorite
  attr_reader :artist

  @@all = []

  def initialize(text, author = nil)
    @text = text
    self.author = author if artist
    self.favorite = false
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def favorite
    self.favorite = true
  end

  def unfavorite
    self.favorite = false
  end

  def self.find_by_author(author)
    all.detect {|q| q.author = author}
  end

end