class CLI

   def welcome
      Artwork.display_logo
      Artwork.display_banner
      main_menu
   end

   def main_menu
      main_menu = TTY::Prompt.new.select("MAIN MENU:", ["Surprise Me!", "Browse Quotes", "My Favorites"])
      case main_menu
      when "Surprise Me!"
         surprise_me
      when "Brose Quotes"
         browse_quotes
      when "My Favorites"
         my_favorites
      end
   end

   def surprise_me
      surprise = Quote.random_quote
      puts surprise.text
      puts surprise.author.name
      what_next = TTY::Prompt.new.select("What now?", ["Another one!", "Add to My Favorites", "Main Menu"])
      case what_next
      when "Another one!"
         surprise_me
      when "Add to My Favorites"
         surprise.make_favorite
         my_favorites
      when "Main Menu"
         main_menu
      end
   end

   def browse_quotes
      quote_categories = TTY::Prompt.new.select("LOVE", "MONEY", "NATURE", "SUCCESS", "HAPPINESS", "COURAGE", "UNIVERSE")

   end

   def my_favorites
      Quote.favorites
   end

   def quote_box(quote)
      box = TTY::Box.frame quote.text, "-#{quote.author.name}", padding: 3, align: :center
      print box
   end

end