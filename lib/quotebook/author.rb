class Author
   attr_accessor :name

   @@all = []

   # GENERAL

   def initialize(name)
      if name == ""
         @name = "Unknown"
      else
         @name = name
      end
      self.class.all << self
   end

   def self.all
      @@all
   end

   def quotes
      quotes = Quote.all.select {|q| q.author == self}
      quotes.collect {|q| q.text}
   end
   
end