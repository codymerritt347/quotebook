module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class CLI

   include Screen

   def main_menu
      Screen.clear

      Window.time_banner("QUOTEBOOK")
      Window.message_window("Welcome to Quotebook!\n\nHere are #{Quote.all.count} Quotes covering #{Genre.unique_genres.count} Topics collected here for you to discover and get inspired. \n\nFind a quote you admire? Add it to My Favorites list to keep it forever... or until you exit the program, we haven't quite covered that yet!\n\nLet's get started! Choose an options below.\n\n(To exit, type \"exit\")")
      Window.bottom_banner(1,2,3,"Random!", "Topics", "My Favorites")

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

         Window.time_banner("AWWW, YOU'RE LEAVING...")
         Window.message_window("GOOD BYE!\n\nThank you for checking out my first ever CLI program!\n\n-Cody")
         Window.reg_banner("ADIOS! CIAO! AUF WEDERSEHEN!")

         sleep(2)
         Screen.clear
         exit!
      end
   end

   def surprise_me
      Screen.clear

      random_num = rand(0..119)
      Quote.all[random_num]
      # binding.pry

      Window.time_banner("SURPISE!")
      Window.quote_window(Quote.all[random_num])
      Window.bottom_banner(1,2,3,"Another!", "Favorite", "Menu")

      prompt = TTY::Prompt.new
      response = prompt.ask("Please enter number for option", convert: :int) do |q|
         q.in 1..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 1
         return_to_surprise
      when 2
         if Quote.all[random_num].favorite == true
            Screen.clear

            Window.time_banner("MESSAGE:")
            Window.message_window("Excuse me...\n\nThis quote has already been added to My Favorites!\n\nDon't remember?Well then, let's revisit!")
            Window.reg_banner("Taking you to My Favorites...")
         else
            Quote.all[random_num].favorite = true
            Screen.clear

            Window.time_banner("MESSAGE:")
            Window.message_window("Great taste! I love that quote, too!\n\nThis quote has been added to My Favorites!\n\nLet's go check it out!")
            Window.reg_banner("Taking you to My Favorites...")
         end
         sleep(2)
         Screen.clear
         binding.pry
         my_favorites
      when 3
         Screen.clear
         main_menu
      end
   end

   def return_to_surprise
      surprise_me
   end

   def browse_quotes
      Screen.clear

      Window.time_banner("TOPICS:")
      Window.browse_window
      Window.bottom_banner(1,2,3,"","","Menu")
      
      prompt = TTY::Prompt.new
      response = prompt.ask("Type number for genre ", convert: :int) do |q|
         q.in 3..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 3
         main_menu
      end
      Screen.clear
      
      Window.time_banner("#{Genre.unique_genres[response-1]}:".upcase)
      Window.genre_window(Genre.unique_genres[response-1])
      Window.bottom_banner(1,2,3,"","Topics","")

      prompt = TTY::Prompt.new
      response = prompt.ask("Type some of the quote you want to see:")
      found_quote = nil
      Quote.all.collect do |quote|
         if quote.text.include?(response)
            found_quote = quote
         end
      end
      Screen.clear

      Window.quote_window(found_quote)
   end

   def my_favorites
      Screen.clear

      Window.time_banner("MY FAVORITES:")
      Window.favorites_window
      Window.bottom_banner(1,2,3,"", "", "main")

      prompt = TTY::Prompt.new
      response = prompt.ask("Type number for genre ", convert: :int) do |q|
         q.in 3..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 3
         main_menu
      end
   end

end