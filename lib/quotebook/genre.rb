class Genre
   attr_accessor :name
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