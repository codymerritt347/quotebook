module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class Window_2

   include Screen

   # Window Parts

   def self.top_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 4) do
         " #{DateTime.now.strftime("%b %d,/%Y %l:%M %p")}\n " + message
      end
      puts box
   end

   def self.middle_section(content = "")
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         content
      end
      puts box
   end

   def self.bottom_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 3) do
         message
      end
      puts box
   end

   def self.options_bar(*options)
      table = TTY::Table.new([options])
      puts table.render(:unicode, alignment: [:center], width: 60, resize: true)
   end

   # Common Windows

   def self.alert_window(message = "")
      Screen.clear
      top_bar("ALERT!")
      middle_section(message)
      bottom_bar
   end

   def self.one_quote_window(quote = Quote.all.first)
      Screen.clear
      top_bar("QUOTE")
      middle_section(
         "\n#{quote.text}\n\n-#{quote.author.name}"
      )
      bottom_bar("From: #{quote.genre.name.upcase}")
   end

   def self.one_topic_window(topic = "age")
      Screen.clear
      table = TTY::Table.new
      counter = 1
      Quote.all.each do |quote|
         if quote.genre.name == topic
            table << ["#{counter}.", "#{quote.author.name.upcase} ", quote.shorter_quote]
            counter += 1
         end
      end
      top_bar(topic.upcase)
      middle_section(
         table.render
      )
      options_bar("PREV", "ALL", "NEXT")
      Quote.all.select {|quote| quote.genre.name == topic}
   end

   # CLI Windows

   def self.main_menu_window
      Screen.clear
      top_bar("MAIN MENU")
      middle_section(
         "WELCOME TO QUOTEBOOK!\n\nBrowse #{Quote.all.count} QUOTES covering #{Genre.unique_genres.count} TOPICS\nall collected here for you to discover and get inspired. \n\nFind a quote you admire?\nAdd it to MY FAVORITES list to keep it forever... or until you exit the program, we haven't quite covered that yet!\n\nLet's get started! Choose an options below.\n\n(To EXIT, type \"exit\")"
      )
      options_bar("RANDOM", "TOPICS", "FAVORITES")
   end

   def self.randomizer_window
      Screen.clear
      random_num = rand(0..119)
      one_quote_window(Quote.all[random_num])
      options_bar("ANOTHER!", "FAVE", "MAIN MENU")
      Quote.all[random_num]
   end

   def self.topics_window
      Screen.clear
      table = TTY::Table.new
      Genre.unique_genres.each_with_index do |value, index|
         table << ["#{index+1}.", value.upcase]
      end
      top_bar("TOPICS")
      middle_section(
         table.render
      )
      options_bar("RANDOM", "MY FAVORITES", "MAIN MENU")
      Genre.unique_genres
   end

   def self.my_favorites_window
      Screen.clear
      table = TTY::Table.new
      if Quote.favorites == []
         table << ["You have not collected any favorites yet!"]
      else
         Quote.favorites.each_with_index do |quote, index|
            table << ["#{index+1}.", "#{quote.author.name.upcase} ", quote.shorter_quote]
         end
      end
      top_bar("MY FAVORITES")
      middle_section(
         table.render
      )
      options_bar("CLEAR", "TOPICS", "MAIN MENU")
      Quote.favorites
   end

   def self.exit_window
      Screen.clear
      top_bar("GOODBYE!")
      middle_section(
         "GOOD BYE!\n\nThank you for\nchecking out my first ever\nCLI program!\n\n-Cody"
      )
      bottom_bar
      exit!
   end

end