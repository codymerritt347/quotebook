class CLI

   def self.main
      Window.main_menu_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please type the option you want:") do |q|
         q.modify :strip, :collapse
         q.validate /random\z|topics\z|favorites\z|exit\z/i
         q.messages[:valid?] = "Sorry, please try again."
      end
      case response.downcase
      when "random"
         randomizer
      when "topics"
         topics
      when "favorites"
         my_favorites
      when "exit"
         Window.exit_window
      end
   end

   def self.randomizer
      caught_quote = Window.randomizer_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please type the option you want:") do |q|
         q.modify :strip, :collapse, :down
         q.validate /another\z|fave\z|main\z/i
         q.messages[:valid?] = "Sorry, please try again."
      end
      case response.downcase
      when "another"
         turn_around(randomizer)
      when "fave"
         caught_quote.check_or_fave
      when "main"
         main
      end
   end

   def self.topics
      options = Window.topics_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please type number of topic:", convert: :int) do |q|
         q.in "1-12"
         q.messages[:range?] = "Sorry, please try again."
      end
      options = Window.one_topic_window(Genre.unique_genres[response-1])
      response = prompt.ask("Please type the number for quote:", convert: :int) do |q|
         q.in "1-15"
         q.messages[:range?] = "Sorry, please try again."
      end
      Window.one_quote_window(options[response-1])
      Window.options_bar("TOPICS", "FAVE", "MAIN")
      response_2 = prompt.ask("Please type option:") do |q|
         q.modify :strip, :collapse
         q.validate /topics\z|fave\z|main\z/i
         q.messages[:valid?] = "Sorry, please try again."
      end
      case response_2.downcase
      when "topics"
         turn_around(topics)
      when "fave"
         options[response-1].check_or_fave
      when "main"
         main
      end
   end

   def self.my_favorites
      Window.my_favorites_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please type the option you want:") do |q|
         q.modify :strip, :collapse
         q.validate /select\z|clear\z|main\z/i
         q.messages[:valid?] = "Sorry, please try again."
      end
      case response.downcase
      when "select"
         response = prompt.ask("Please type the number for quote:", convert: :int) do |q|
            q.validate(/\d/, "Please try again.")
         end
         until response <= Quote.favorites.count
            puts "This isn't a quote!"
         end
         Window.one_quote_window(Quote.favorites[response-1])
         Window.options_bar("BACK", "UNFAVE", "MAIN")
         response_2 = prompt.ask("Please type option:") do |q|
            q.modify :strip, :collapse
            q.validate /back\z|unfave\z|main\z/i
            q.messages[:valid?] = "Sorry, please try again."
         end
         case response_2.downcase
         when "back"
            turn_around(my_favorites)
         when "unfave"
            Quote.favorites[response-1].favorite = false
            Window.alert_window("Changed your mind?!\n\nI'm not feeling that quote anymore either...\n\nThis quote has been removed from FAVORITES!")
            turn_around(my_favorites)
         when "main"
            main
         end
      when "clear"
         Window.alert_window("Clearing your Favorites List!")
         Quote.favorites.each {|q| q.favorite = false}
         turn_around(my_favorites)
      when "main"
         main
      end
   end

   def self.turn_around(menu)
      menu
   end

end