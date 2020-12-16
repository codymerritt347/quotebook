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

  # FAVORTING
  
  def self.favorites
    all.select {|q| q.favorite == true}
  end

  def check_or_fave
    if self.favorite == true
      Window.alert_window("Excuse me...\n\nThis quote has already been added to FAVORITES!\n\nDon't remember?\nWell then, let's revisit!")
      CLI.my_favorites
    else
      self.favorite = true
      Window.alert_window("Great taste!\nI love that quote, too!\n\nThis quote has been added to FAVORITES!\n\nLet's go check it out!")
      CLI.my_favorites
    end
  end
  
  # RANDOM

  def self.random_quote
    random_number = rand(0..179)
    random_quote = all[random_number]
    random_quote
  end

  # FORMATTING

  def shorter_quote
    self.text[0...25] + "..."
  end

end