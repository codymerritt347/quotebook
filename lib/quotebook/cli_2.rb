class CLI_2

   def main
      Window_2.main_menu_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please type the option you want:") do |q|
         q.modify :strip, :collapse
         q.validate /random|topics|favorites|exit/
         q.messages[:valid?] = "Sorry, please try again."
      end
   end

   def randomizer
   end

   def topics
   end

   def my_favorites
   end

   def turn_around(menu)
      self.menu
   end

end