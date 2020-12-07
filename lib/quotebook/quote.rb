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

  def self.favorites
    # favorite_quotes = []
    # all.each do |quote|
    #   if quote.favorite == true
    #     favorite_quotes << self
    #   end
    # end
    # puts favorite_quotes
  end

  def self.authors
  end

  def self.texts
  end
end