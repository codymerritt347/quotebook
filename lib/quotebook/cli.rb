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
      Window.message_window("WELCOME TO QUOTEBOOK!\n\nBrowse #{Quote.all.count} QUOTES covering #{Genre.unique_genres.count} TOPICS\nall collected here for you to discover and get inspired. \n\nFind a quote you admire?\nAdd it to MY FAVORITES list to keep it forever... or until you exit the program, we haven't quite covered that yet!\n\nLet's get started! Choose an options below.\n\n(To EXIT, type \"exit\")")
      Window.bottom_banner(1,2,3,"RANDOM", "TOPICS", "MY FAVORITES")

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
         Window.message_window("GOOD BYE!\n\nThank you for\nchecking out my first ever\nCLI program!\n\n-Cody")
         Window.reg_banner("ADIOS! AU REVOIR! CIAO! AUF WIEDERSEHEN!\nTOTSIENS! YASOU! ALOHA! NAMASTE! SLAN!")

         sleep(2)
         Screen.clear
         exit!
      end
   end

   def surprise_me
      random_num = rand(0..119)
      Quote.all[random_num]

      Screen.clear
      Window.time_banner("RANDOM!")
      Window.quote_window(Quote.all[random_num])
      Window.bottom_banner(1,2,3,"ANOTHER!", "FAVE", "MENU")

      prompt = TTY::Prompt.new
      response = prompt.ask("Please enter number for option", convert: :int) do |q|
         q.in 1..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 1
         return_to_window(surprise_me)
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

         my_favorites
      when 3
         Screen.clear
         main_menu
      end
   end

   def return_to_window(window)
      window
   end

   def browse_quotes
      Screen.clear
      Window.time_banner("TOPICS:")
      Window.browse_window
      
      prompt = TTY::Prompt.new
      response = prompt.ask("Type number for genre ", convert: :int) do |q|
         q.in 1..12
         q.messages[:range?] = "I don't understand. Try again?"
      end
      Screen.clear
      Window.time_banner("#{Genre.unique_genres[response-1]}:".upcase)
      Window.genre_window(Genre.unique_genres[response-1])

      prompt = TTY::Prompt.new
      response = prompt.ask("Type some of the quote you want to see:")
      found_quote = nil
      Quote.all.collect do |quote|
         if quote.text.include?(response)
            found_quote = quote
         end
      end
      Screen.clear
      Window.time_banner("QUOTEBOOK")
      Window.quote_window(found_quote)
      Window.bottom_banner(1,2,3,"BACK","FAVE","MENU")

      prompt = TTY::Prompt.new
      response = prompt.ask("Please enter number for option", convert: :int) do |q|
         q.in 1..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 1
         Screen.clear
         return_to_window(browse_quotes)
      when 2
         if found_quote.favorite == true
            Screen.clear
            Window.time_banner("MESSAGE:")
            Window.message_window("Excuse me...\n\nThis quote has already been added to My Favorites!\n\nDon't remember?Well then, let's revisit!")
            Window.reg_banner("Taking you to My Favorites...")
         else
            found_quote.favorite = true
            Screen.clear
            Window.time_banner("MESSAGE:")
            Window.message_window("Great taste! I love that quote, too!\n\nThis quote has been added to My Favorites!\n\nLet's go check it out!")
            Window.reg_banner("Taking you to My Favorites...")
         end
      when 3
         main_menu
      end
      sleep(2)
      Screen.clear
      Window.time_banner("MY FAVORITES:")
      my_favorites
   end

   def my_favorites
      Screen.clear
      Window.time_banner("MY FAVORITES:")
      if Quote.favorites.empty?
         Window.message_window("NO FAVORITES YET!")
      else
         Window.favorites_window
      end
      Window.bottom_banner(1,2,3,"SELECT", "CLEAR", "MENU")

      prompt = TTY::Prompt.new
      response = prompt.ask("Type number of options:", convert: :int) do |q|
         q.in 1..3
         q.messages[:range?] = "I don't understand. Try again?"
      end
      case response
      when 1
         puts "Select a quote by number:"
      when 2
         Quote.all.each do |quote|
            quote.favorite = false
         end
         Screen.clear
         main_menu
      when 3
         Screen.clear
         main_menu
      end
   end

end