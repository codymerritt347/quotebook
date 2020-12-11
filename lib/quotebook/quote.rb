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
    self.favorite? "This Quote is already a favorite!" : @favorite = true
    "Added Quote to My Favorites"
  end

  def unfavorite
    self.favorite? @favorite = false | "This Quote hasn't been favorited!"
    "Removed Quote from My Favorites"
  end

  def self.favorites
    results = all.select {|q| q.favorite == true}
    results.collect {|q| q.text}
  end

  # FORMATTING

  def shorter_quote
    self.text[0...50] + "..."
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