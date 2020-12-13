class Author
   attr_reader :name

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
   
end