class CLI

   def start
      API.new.collect_quotes
      self.class.main
   end

   def self.main
      Window.main_menu_window
      prompt = TTY::Prompt.new
      response = prompt.ask("Please enter an option by NAME:") do |q|
         q.modify :strip, :collapse
         q.validate /random\z|topics\z|favorites\z|exit\z/i
         q.messages[:valid?] = "I'm sorry, I don't understand. Please enter again."
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
      response = prompt.ask("Please enter an option by NAME:") do |q|
         q.modify :strip, :collapse, :down
         q.validate /another\z|fave\z|main\z/i
         q.messages[:valid?] = "I'm sorry, I don't understand. Please enter again."
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
      response = prompt.ask("Please enter a topic by NUMBER:", convert: :int) do |q|
         q.in "1-12"
         q.messages[:range?] = "I'm sorry, I don't understand. Please enter again."
      end
      options = Window.one_topic_window(Genre.unique_genres[response-1])
      response = prompt.ask("Please enter a quote by NUMBER:", convert: :int) do |q|
         q.in "1-15"
         q.messages[:range?] = "I'm sorry, I don't understand. Please enter again."
      end
      Window.one_quote_window(options[response-1])
      Window.options_bar("TOPICS", "FAVE", "MAIN")
      response_2 = prompt.ask("Please enter an option by NAME:") do |q|
         q.modify :strip, :collapse
         q.validate /topics\z|fave\z|main\z/i
         q.messages[:valid?] = "I'm sorry, I don't understand. Please enter again."
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
      response = prompt.ask("Please enter an option by NAME:") do |q|
         q.modify :strip, :collapse
         q.validate /select\z|clear\z|main\z/i
         q.messages[:valid?] = "I'm sorry, I don't understand. Please enter again."
      end
      case response.downcase
      when "select"
         if Quote.favorites == []
            Window.alert_window("There is no quote to select!")
            turn_around(my_favorites)
         else
            response = prompt.ask("Please enter a quote by NUMBER:", convert: :int) do |q|
               q.validate(/\d/, "I'm sorry, I don't understand. Please enter again.")
            end
            until response <= Quote.favorites.count
               puts "I'm sorry, I don't understand. Please enter again."
            end
            Window.one_quote_window(Quote.favorites[response-1])
            Window.options_bar("BACK", "UNFAVE", "MAIN")
            response_2 = prompt.ask("Please enter an option by NAME:") do |q|
               q.modify :strip, :collapse
               q.validate /back\z|unfave\z|main\z/i
               q.messages[:valid?] = "I'm sorry, I don't understand. Please enter again."
            end
            case response_2.downcase
            when "back"
               turn_around(my_favorites)
            when "unfave"
               Quote.favorites[response-1].favorite = false
               Window.alert_window("Changed your mind?\n\nI'm not feeling that\nquote anymore either...\n\nThis quote has been removed from your FAVORITES!")
               turn_around(my_favorites)
            when "main"
               main
            end
         end
      when "clear"
         if Quote.favorites != []
            Window.alert_window("Removing all quotes from your FAVORITES!")
            Quote.favorites.each {|q| q.favorite = false}
            turn_around(my_favorites)
         else
            Window.alert_window("There are no quotes to clear!")
            turn_around(my_favorites)
         end
      when "main"
         main
      end
   end

   def self.turn_around(menu)
      menu
   end

end