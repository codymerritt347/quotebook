class CLI

   def welcome
      Artwork.display_logo
      Artwork.display_banner
      main_menu
   end

   def main_menu
      prompt = TTY::Prompt.new
      prompt.select("MAIN MENU:", ["Surprise Me!", "Browse Quotes", "My Favorites"])
      case prompt
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
      prompt = TTY::Prompt.new
      prompt.select("What now?", ["Another one!", "Add to My Favorites", "Main Menu"])
      case prompt
      when "Another one!"
         surprise_me
      when "Add to My Favorites"
         surprise.make_favorite
         prompt
      when "Main Menu"
         main_menu
      end
   end

   def browse_quotes
      prompt = TTY::Prompt.new
      prompt.select("LOVE", "MONEY", "NATURE", "SUCCESS", "HAPPINESS", "COURAGE", "UNIVERSE")
      case prompt
      when "LOVE"
      when "MONEY"
      when "NATURE"
      when "SUCCESS"
      when "HAPPINESS"
      when "COURAGE"
      when "UNIVERSE"
      end
   end

   def my_favorites
      prompt = TTY::Prompt.new
      prompt.select("Your Favorites:", Quote.all, per_page: 4)
   end

   def quote_box(quote)
      box = TTY::Box.frame quote.text, "-#{quote.author.name}", padding: 3, align: :center
      print box
   end

end