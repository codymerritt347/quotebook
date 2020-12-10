class Quote
  @@all = []
  attr_accessor :text, :author, :favorite

  def initialize(text, author)
    self.text = text
    self.author = author
    self.favorite = false
    save
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.authors
  end

  def self.texts
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