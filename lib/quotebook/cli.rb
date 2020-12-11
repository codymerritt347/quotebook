class CLI

   DAILY_QUOTE_ID = rand(0..999)

   def welcome
      Artwork.display_logo
      Artwork.display_banner
      main_menu
   end

   def main_menu
      main_menu = TTY::Prompt.new.select("MAIN MENU:", ["Quote of the Day", "Discover Quotes", "My Favorites", "Guessing Game"])
      case main_menu
      when "Quote of the Day"
         quote_of_the_day
      when "Discover Quotes"
         discover_quotes
      when "My Favorites"
         my_favorites
      when "Guessing Game"
         guessing_game
      end
   end

   def quote_of_the_day
      puts Quote.all[DAILY_QUOTE_ID].text.colorize(:blue)
      puts Quote.all[DAILY_QUOTE_ID].author.name.colorize(:red)
      prompt = TTY::Prompt.new.yes?("Do you want to add this quote to your Favorites?")
      if prompt
         Quote.all[DAILY_QUOTE_ID].make_favorite
      else
         Quote.all[DAILY_QUOTE_ID]
      end
      main_menu
   end

   def discover_quotes
   end

   def my_favorites
      if Quote.favorites.empty?
         puts "You have no Favorites!"
      else
         Quote.all.favorites.each do |quote|
            puts quote
         end
      end
   end

   def guessing_game
   end

   def quote_box(quote)
      box = TTY::Box.frame quote.text, "-#{quote.author.name}", padding: 3, align: :center
      print box
   end

end