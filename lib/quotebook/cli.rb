class CLI

   DAILY_QUOTE_ID = rand(0..999)

   def welcome
      display_logo
      display_banner
      binding.pry
      main_menu
   end

   def main_menu
      prompt = TTY::Prompt.new
      main_menu = prompt.select("MAIN MENU:", ["Quote of the Day", "Discover Quotes", "My Favorites", "Guessing Game"])
      case main_menu
      when "Quote of the Day"
         quote_of_the_day
      when "Discover Quotes"
         discover_quotes
      when "My Favorites"
         my_favorites
      when "Guessing Game"
         guessing_game
      else
         puts "Do you want to quit?"
      end
   end

   def quote_of_the_day
      puts Quote.all[DAILY_QUOTE_ID].text.colorize(:blue)
      puts Quote.all[DAILY_QUOTE_ID].author.colorize(:red)
   end

   def discover_quotes
   end

   def my_favorites
   end

   def guessing_game
   end

   def exit
   end

   def display_logo
      puts "
      ░██████╗░██╗░░░██╗░█████╗░████████╗███████╗██████╗░░█████╗░░█████╗░██╗░░██╗
      ██╔═══██╗██║░░░██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░██╔╝
      ██║██╗██║██║░░░██║██║░░██║░░░██║░░░█████╗░░██████╦╝██║░░██║██║░░██║█████═╝░
      ╚██████╔╝██║░░░██║██║░░██║░░░██║░░░██╔══╝░░██╔══██╗██║░░██║██║░░██║██╔═██╗░
      ░╚═██╔═╝░╚██████╔╝╚█████╔╝░░░██║░░░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░╚██╗
      ░░░╚═╝░░░░╚═════╝░░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝
      ".colorize(:light_blue)
   end

   def display_banner
      puts "
             .:+oossssssssssssssssssssssssssssss+  `:+oo/-    -+oo+:      
             :os/-.`                                 +oooooo-  :oooooo/     
           .os:                                      /oooooo:  -ooooooo     
          .so`                                        -////o`   .:///o-     
          +s.                                           `:+.       -+-      
          ss                                          `::.       :/-        
          ss                                                         -+-    
          ss              Welcome to Quotebook!                      :s:    
          ss              Find a little inspiration                  :s:    
          ss              from some of the world's                   :s:    
          ss              greatest thinkers.                         :s:    
          ss                                                         :s:    
          ss                                   -Cody M.              :s:    
          oo   `         `                                           :s:    
            .//-      `:/-`                                          :s:    
           //`       -+.                                             os.    
          /o+oo+:   -o+ooo/`                                       `+s:     
          ooooooo:  /oooooo+                                     `:oo-      
          :oooooo-  .oooooo/  `...............................-:+so:        
           `://:`    `-//:.   .+++++++++++++++++++++++++++++++/:-`          
      ".colorize(:light_cyan)
   end
end