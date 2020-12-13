module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class CLI

   include Screen

   def main_menu
      Screen.clear

      Window.reg_banner("Quotebook:")
      Window.message_window("Welcome to Quotebook!\nTo exit, type \"exit\"")
      Window.bottom_banner(1,2,3,"Random!", "Browse", "Favorites")

      user_input = nil
      until (user_input == "1" || user_input == "2" || user_input == "3" || user_input == "exit")
         puts "Please enter number for option:"
         user_input = gets.chomp.downcase
      end
      case user_input
      when "1"
         surprise_me
      when "2"
         browse_quotes
      when "3"
         my_favorites
      when "exit"
         Screen.clear

         Window.reg_banner("You're leaving!")
         Window.message_window("BYE! Thank you for checking out my CLI!")
         Window.reg_banner("Auf Wedersehen !")

         sleep(2)
         Screen.clear
         exit!
      end
   end

   def surprise_me
      Screen.clear
      random_num = rand(0..119)
      random_quote = Quote.all[random_num]

      Window.reg_banner("Hit Me With Your Best Quote!")
      Window.quote_window(random_quote)
      Window.bottom_banner(1,2,3,"Another!", "Favorite", "Menu")

      user_input = nil
      until (user_input == "1" || user_input == "2" || user_input == "3")
          puts "Please enter number for option:"
          user_input = gets.chomp.downcase
      end
      case user_input
      when "1"
         return_to_surprise
      when "2"
         random_quote.favorite = true
         Screen.clear

         Window.reg_banner("Message:")
         Window.message_window("This quote has been added to your favorites!")
         Window.reg_banner("Taking you to Favorites...")

         sleep(2)
         Screen.clear
         my_favorites
      when "3"
         main_menu
      end
   end

   def return_to_surprise
      surprise_me
   end

   def browse_quotes
      Screen.clear

      Window.reg_banner("Browse Quotes:")
      Window.browse_window
      
      prompt = TTY::Prompt.new
      response = prompt.ask("Type number for genre ", convert: :int) do |q|
         q.in "1-12"
         q.messages[:range?] = "I don't understand. Try again?"
      end
      Screen.clear
      
      Window.reg_banner("#{Genre.unique_genres[response-1]}:".upcase)
      Window.genre_window(Genre.unique_genres[response-1])

      prompt = TTY::Prompt.new
      response = prompt.ask("Type some of the quote you want to see:")
      found_quote = nil
      Quote.all.collect do |quote|
         if quote.text.include?(response)
            found_quote = quote
         end
      end
      Window.quote_window(found_quote)
   end

   def my_favorites
      Screen.clear

      Window.reg_banner("My Favorites:")
      Window.message_window("")
      Window.bottom_banner(1,2,3,"prev", "next", "main")
   end

end