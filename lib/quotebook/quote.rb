class Quote
  @@all = []
  attr_accessor :text, :author, :favorite

  def initialize(text:, author:, favorite:)
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
end