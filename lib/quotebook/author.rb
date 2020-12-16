class Author
   attr_reader :name

   @@all = []
   @@unique_authors = []

   # GENERAL

   def initialize(name)
      if name == ""
         @name = "Unknown"
      else
         @name = name
      end
      self.class.all << self
      self.class.unique_authors << name unless self.class.unique_authors.include?(name)
   end

   def self.all
      @@all
   end

   def self.unique_authors
      @@unique_authors
   end

   def shorter_name
      if self.name.length >= 14
         self.name[0...13] + "..."
      else
         self.name
      end
   end
end