module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class CLI

   include Screen

   def main_menu
      Screen.clear
      top_banner("Quotebook:")
      main_window("Welcome to Quotebook!\nTo exit, type \"exit\"")
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
         top_banner("You're leaving!")
         main_window("BYE! Thank you for checking out my CLI!")
         top_banner("Auf Wedersehen!")
         sleep(2)
         Screen.clear
         exit!
      end
   end

   def surprise_me
      Screen.clear
      random_num = rand(0..119)
      random_quote = Quote.all[random_num]
      top_banner("Hit Me With Your Best Quote!")
      quote_window(random_quote)
      bottom_banner(1,2,3,"Another!", "Favorite", "Menu")

      prompt = "> " 
      print prompt
      user_input = nil
      until (user_input == 1 || user_input == 2 || user_input == 3)
          puts "Please enter number for option:" 
          user_input = gets.chomp.to_i
      end
      case user_input
      when 1
         return_to_surprise
      when 2
         random_quote.favorite = true
         Screen.clear
         top_banner("Message:")
         main_window("This quote has been added to your favorites!")
         top_banner("Taking you to Favorites...")
         sleep(2)
         Screen.clear
         my_favorites
      when 3
         main_menu
      end
   end

   def return_to_surprise
      surprise_me
   end

   def browse_quotes
      Screen.clear
      top_banner("Browse Quotes:")
      main_window("")
      bottom_banner(1,2,3,"Love", "Nature", "Success")
      bottom_banner(4,5,6,"Happiness", "Courage", "Universe")
      bottom_banner(7,8,9,"Main","","")
   end

   def my_favorites
      Screen.clear
      top_banner("My Favorites:")
      main_window("")
      bottom_banner(1,2,3,"prev", "next", "main")
      # table = TTY::Table.new
      # table << ["", "Author", "Quote"]
      # x = 1
      # Quote.favorites.each do |quote|
      #    table << [x, quote.author.name, quote.text]
      #    x+=1
      # end
      # puts table.render(:unicode, resize: true)
      # main_menu
   end

   # MAIN WINDOWS

   def top_banner(page)
      box = TTY::Box.frame(width: 45, height: 3) do
         " #{page}"
      end
      puts box
   end

   def main_window(message)
      box = TTY::Box.frame(width: 45, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         message
      end
      puts box
   end

   def quote_window(quote)
      box = TTY::Box.frame(width: 45, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         "#{quote.text}\n\n-#{quote.author.name}"
      end
      puts box
   end

   def bottom_banner(a,b,c,x,y,z)
      table = TTY::Table.new
      table << ["#{a}. #{x}","#{b}. #{y}","#{c}. #{z}"]
      puts table.render(:unicode, alignment: [:center], width: 45, resize: true)
   end
end