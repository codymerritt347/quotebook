class Author
   attr_accessor :name

   @@all = []

   def initialize(name = "Unknown")
      @name = name
      save
   end

   def self.all
      @@all
   end

   def save
      self.class.all << self
   end

end