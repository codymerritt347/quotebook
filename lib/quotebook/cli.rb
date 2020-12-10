class CLI

   DAILY_QUOTE_ID = rand(0..999)

   def welcome
      Artwork.display_logo
      display_banner
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
      puts Quote.all[DAILY_QUOTE_ID].author.colorize(:red)
      prompt = TTY::Prompt.new.yes?("Do you want to add this quote to your Favorites?")
      if prompt
         Quote.all[DAILY_QUOTE_ID].favorite = true
      else
         Quote.all[DAILY_QUOTE_ID].favorite = false
      end
      main_menu
   end

   def discover_quotes
   end

   def my_favorites
      if Quote.favorites.empty?
         puts "You have no Favorites!"
      else
         Quote.favorites
      end
   end

   def guessing_game
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