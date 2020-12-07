class CLI

   def self.display_quotes
      Quote.all.each do |quote|
         puts quote.text
         puts quote.author
         # binding.pry
      end
   end

end