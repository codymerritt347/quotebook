class Quote

  attr_accessor :text, :author, :favorite, :keywords

  @@all = []

  # GENERAL

  def initialize(text, author)
    @text = text
    @author = author
    @favorite = false
    @keywords = []
    self.class.all << self
  end

  def self.all
    @@all
  end

  # FAVORTES

  def make_favorite
    if self.favorite == true
      puts "This Quote is already in My Favorites!"
    else
      self.favorite = true
      puts "This Quote has been added to My Favorites"
    end
  end

  def unfavorite
    if self.favorite == false
      puts "This Quote is not in My Favorites!"
    else
      self.favorite = false
      puts "This Quote has been removed from My Favorites"
    end
  end

  def self.favorites
    all.select {|q| q.favorite == true}
  end
  
  # RANDOM

  def self.random_quote
    random_number = rand(0..499)
    random_quote = all[random_number]
    random_quote
  end

  # KEYWORDS

  def self.create_keywords
    all.each do |quote|
      if quote.text.match(/\b[Ll]ove\b/)
        quote.keywords << "Love"
      elsif quote.text.match(/\b[Mm]oney\b/)
        quote.keywords << "Money"
      elsif quote.text.match(/\b[Nn]ature\b/)
        quote.keywords << "Nature"
      elsif quote.text.match(/\b[Ss]uccess\b/)
        quote.keywords << "Success"
      elsif quote.text.match(/\b[Hh]appy|[Hh]appiness\b/)
        quote.keywords << "Happiness"
      elsif quote.text.match(/\b[Cc]ourage\b/)
        quote.keywords << "Courage"
      elsif quote.text.match(/\b[Uu]niverse\b/)
        quote.keywords << "Universe"
      end
    end
    puts "Creating keywords..."
  end

  # FORMATTING

  def shorter_quote
    self.text[0...50] + "..."
  end

  def self.display_quotes(quotes_hash)
    short_quotes = []
    quotes_hash.collect do |quote|
      short_quotes << quote.shorter_quote
    end
    short_quotes
  end

end