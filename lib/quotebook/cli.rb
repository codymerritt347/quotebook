class CLI

   def welcome
      display_logo
      display_scroll
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
      logo = "
      ░██████╗░██╗░░░██╗░█████╗░████████╗███████╗██████╗░░█████╗░░█████╗░██╗░░██╗
      ██╔═══██╗██║░░░██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░██╔╝
      ██║██╗██║██║░░░██║██║░░██║░░░██║░░░█████╗░░██████╦╝██║░░██║██║░░██║█████═╝░
      ╚██████╔╝██║░░░██║██║░░██║░░░██║░░░██╔══╝░░██╔══██╗██║░░██║██║░░██║██╔═██╗░
      ░╚═██╔═╝░╚██████╔╝╚█████╔╝░░░██║░░░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░╚██╗
      ░░░╚═╝░░░░╚═════╝░░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝
      "
      puts logo.colorize(:light_blue)
   end

   def display_scroll
      scroll = <<-ARTWORK

         (\ 
         \'\ 
          \'\     __________
          / '|   ()_________)
          \ '/    \ ~~~~~~~~ \
            \       \ ~~~~~~   \
           ==).      \__________\
          (__)       ()__________)

      ARTWORK
      puts scroll.colorize(:light_yellow)
   end

end