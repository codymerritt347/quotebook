class Genre
   
   attr_reader :name
   @@all = []
   @@unique_genres = []

   # GENERAL

   def initialize(name)
      @name = name
      self.class.all << self
      self.class.unique_genres << name unless self.class.unique_genres.include?(name)
   end

   def self.all
      @@all
   end

   def self.unique_genres
      @@unique_genres
   end
   
end