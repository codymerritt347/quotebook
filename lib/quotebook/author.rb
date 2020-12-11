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
   
end