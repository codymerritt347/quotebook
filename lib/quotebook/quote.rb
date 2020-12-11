class Quote

  attr_accessor :text, :favorite, :author

  @@all = []

  # GENERAL

  def initialize(text, author)
    @text = text
    @author = author
    @favorite = false
    self.class.all << self
  end

  def self.all
    @@all
  end

  # FAVORTES

  def make_favorite
    if self.favorite == true
      "This Quote is already in My Favorites!"
    else
      self.favorite = true
      "This Quote has been added to My Favorites"
    end
  end

  def unfavorite
    if self.favorite == false
      "This Quote is not in My Favorites!"
    else
      self.favorite = false
      "This Quote has been removed from My Favorites"
    end
  end

  def self.favorites
    results = all.select {|q| q.favorite == true}
    results.collect {|q| q.text}
  end

  # FORMATTING

  def shorter_quote
    self.text[0...50] + "..."
  end
  
  # RANDOM

  def self.random_quote
    random_number = rand(0..4999)
    all[random_number]
  end

  # CATEGORIES

  def self.love_quotes
    love_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Ll]ove\b/)
        love_quotes << quote
      end
    end
    love_quotes
  end

  def self.money_quotes
    money_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Mm]oney\b/)
        money_quotes << quote
      end
    end
    money_quotes
  end

  def self.nature_quotes
    nature_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Nn]ature\b/)
        nature_quotes << quote
      end
    end
    nature_quotes
  end

  def self.success_quotes
    success_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Ss]uccess\b/)
        success_quotes << quote
      end
    end
    success_quotes
  end

  def self.happy_quotes
    happy_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Hh]appy|[Hh]appiness\b/)
        happy_quotes << quote
      end
    end
    happy_quotes
  end

  def self.courage_quotes
    courage_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Cc]ourage\b/)
        courage_quotes << quote
      end
    end
    courage_quotes
  end

  def self.universe_quotes
    universe_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Uu]niverse\b/)
        universe_quotes << quote
      end
    end
    universe_quotes
  end

end