class Quote

  attr_accessor :favorite
  attr_reader :text, :author, :genre

  @@all = []

  # GENERAL

  def initialize(text, author, genre)
    @text = text
    @author = author
    @genre = genre
    @favorite = false
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.favorites
    all.select {|q| q.favorite == true}
  end
  
  # RANDOM

  def self.random_quote
    random_number = rand(0..4999)
    random_quote = all[random_number]
    random_quote
  end

  # FORMATTING

  def shorter_quote
    self.text[0...30] + "..."
  end

  def self.display_quotes(quotes_hash)
    short_quotes = []
    quotes_hash.collect do |quote|
      short_quotes << quote.shorter_quote
    end
    short_quotes
  end

end