class CLI

   def welcome
      Artwork.display_logo
      sleep(2)
      main_menu
   end

   def main_menu
      Artwork.display_banner
      prompt = TTY::Prompt.new
      selection = prompt.select("MAIN MENU:", ["Surprise Me!", "Browse Quotes", "My Favorites"])
      case selection
      when "Surprise Me!"
         surprise_me
      when "Browse Quotes"
         browse_quotes
      when "My Favorites"
         my_favorites
      end
   end

   def surprise_me
      puts "Don't find the Quote. Let the Quote find YOU!"
      sleep(1)
      surprise = Quote.random_quote
      box = TTY::Box.frame(width: 40, height: 15, align: :center, padding: 3) do
         "#{surprise.text}\n\n-#{surprise.author.name}"
      end
      print box
      prompt = TTY::Prompt.new
      selection = prompt.select("Deep... What do you think?", ["Nah...Try another one!", "Yes! Add to My Favorites", "Main Menu"])
      case selection
      when "Nah...Try another one!"
         surprise_me
      when "Yes! Add to My Favorites"
         surprise.make_favorite
         main_menu
      when "Main Menu"
         main_menu
      end
   end

   def browse_quotes
      prompt = TTY::Prompt.new
      selection = prompt.select("Select:", ["LOVE", "MONEY", "NATURE", "SUCCESS", "HAPPINESS", "COURAGE", "UNIVERSE"])
      case selection
      when "LOVE"
         display_quotes(Quote.love_quotes)
      when "MONEY"
         display_quotes(Quote.money_quotes)
      when "NATURE"
         display_quotes(Quote.nature_quotes)
      when "SUCCESS"
         display_quotes(Quote.success_quotes)
      when "HAPPINESS"
         display_quotes(Quote.happy_quotes)
      when "COURAGE"
         display_quotes(Quote.courage_quotes)
      when "UNIVERSE"
         display_quotes(Quote.universe_quotes)
      end
   end

   def display_quotes(hash)
      table = TTY::Table.new
      table << ["", "Author", "Quote"]
      x = 1
      hash.each do |quote|
         table << [x, quote.author.name, quote.shorter_quote]
         x+=1
      end
      puts table.render(:unicode)
      browse_quotes
   end

   def my_favorites
      puts "THESE ARE MY FAVORITES"
      table = TTY::Table.new
      table << ["", "Author", "Quote"]
      x = 1
      Quote.favorites.each do |quote|
         table << [x, quote.author.name, quote.text]
         x+=1
      end
      puts table.render(:unicode, resize: true)
      main_menu
   end

end