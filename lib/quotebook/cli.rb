module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class CLI

   include Screen

   def main_menu
      Screen.clear

      reg_banner("Quotebook:")
      message_window("Welcome to Quotebook!\nTo exit, type \"exit\"")
      bottom_banner(1,2,3,"Random!", "Browse", "Favorites")

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

         reg_banner("You're leaving!")
         message_window("BYE! Thank you for checking out my CLI!")
         reg_banner("Auf Wedersehen !")

         sleep(2)
         Screen.clear
         exit!
      end
   end

   def surprise_me
      Screen.clear
      random_num = rand(0..119)
      random_quote = Quote.all[random_num]

      reg_banner("Hit Me With Your Best Quote!")
      quote_window(random_quote)
      bottom_banner(1,2,3,"Another!", "Favorite", "Menu")

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

         reg_banner("Message:")
         message_window("This quote has been added to your favorites!")
         reg_banner("Taking you to Favorites...")

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

      reg_banner("Browse Quotes:")
      browse_window
      
      prompt = TTY::Prompt.new
      response = prompt.ask("Type number for genre ", convert: :int) do |q|
         q.in "1-12"
         q.messages[:range?] = "I don't understand. Try again?"
      end
      genre_window(Genre.unique_genres[response-1])
   end

   def my_favorites
      Screen.clear

      reg_banner("My Favorites:")
      message_window("")
      bottom_banner(1,2,3,"prev", "next", "main")
   end

   # MAIN WINDOWS

   def reg_banner(message)
      box = TTY::Box.frame(width: 60, height: 4) do
         "#{Time.now}\n#{message}"
      end
      puts box
   end

   def message_window(message)
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         message
      end
      puts box
   end

   def quote_window(quote)
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         "#{quote.text}\n\n-#{quote.author.name}"
      end
      puts box
   end

   def browse_window
      table = TTY::Table.new
      Genre.unique_genres.each_with_index do |genre,index|
         table << ["#{index+1}.", genre]
      end
      puts table.render(:unicode, width: 60, resize: true)
   end

   def genre_window(genre)
      table = TTY::Table.new
      x=1
      Quote.all.collect do |quote|
         table << ["#{x}.", quote.author.name, quote.shorter_quote] if quote.genre.name == genre
         x+=1
      end
      puts table.render(:unicode, width: 60, resize: true)
   end

   def bottom_banner(a,b,c,x,y,z)
      table = TTY::Table.new
      table << ["#{a}. #{x}","#{b}. #{y}","#{c}. #{z}"]
      puts table.render(:unicode, alignment: [:center], width: 60, resize: true)
   end
end