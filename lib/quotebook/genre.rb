class Genre
   attr_reader :name
   @@all = []

   # GENERAL

   def initialize(name)
      @name = name
      self.class.all << self
   end

   def self.all
      @@all
   end
   
end