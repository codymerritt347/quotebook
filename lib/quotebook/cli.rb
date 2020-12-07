class CLI

   DAILY_QUOTE_ID = rand(1..1000)

   def welcome
      display_logo
      display_banner
   end

   def main_menu
   end

   def quote_of_the_day
   end

   def fine_quote
   end

   def favorites
   end

   def quote_game
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