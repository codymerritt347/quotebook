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

  def shorter_quote
    self.text[0...30] + "..."
  end

  # def self.love_quotes
  #   all.collect{|q|q.text}.grep(/\b[Hh]eaven\b/).count
  # end

  def self.love_quotes
    love_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Ll]ove\b/)
        love_quotes << quote
      end
    end
    puts love_quotes.count
  end

  def self.money_quotes
    money_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Mm]oney\b/)
        money_quotes << quote
      end
    end
    puts money_quotes.count
  end

  def self.nature_quotes
    nature_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Nn]ature\b/)
        nature_quotes << quote
      end
    end
    puts nature_quotes.count
  end

  def self.success_quotes
    success_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Ss]uccess\b/)
        success_quotes << quote
      end
    end
    puts success_quotes.count
  end

  def self.happy_quotes
    happy_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Hh]appy|[Hh]appiness\b/)
        happy_quotes << quote
      end
    end
    puts happy_quotes.count
  end

  def self.courage_quotes
    courage_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Cc]ourage\b/)
        courage_quotes << quote
      end
    end
    puts courage_quotes.count
  end

  def self.universe_quotes
    universe_quotes = []
    all.collect do |quote|
      if quote.text.match(/\b[Uu]niverse\b/)
        universe_quotes << quote
      end
    end
    puts universe_quotes.count
  end

end