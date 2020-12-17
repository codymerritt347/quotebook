class Window

   include Screen

   # Window Parts

   def self.top_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 4) do
         " #{DateTime.now.strftime("%b %d, %Y %l:%M %p")}\n " + message
      end
      puts box
   end

   def self.middle_section(content = "")
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         content
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
      sleep(3)
   end

   def self.one_quote_window(quote = Quote.all.first)
      Screen.clear
      top_bar("QUOTE"+" from: " + quote.genre.name.upcase)
      middle_section(
         "\n#{quote.text}\n\n-#{quote.author.name}"
      )
   end

   def self.one_topic_window(topic = "age")
      Screen.clear
      table = TTY::Table.new
      counter = 1
      Quote.all.each do |quote|
         if quote.genre.name == topic
            table << ["#{counter}.", "#{quote.author.shorter_name.upcase} ", quote.shorter_quote]
            counter += 1
         end
      end
      top_bar("TOPIC: " + topic.upcase)
      middle_section(
         table.render
      )
      Quote.all.select {|quote| quote.genre.name == topic}
   end

   # CLI Windows

   def self.main_menu_window
      Screen.clear
      top_bar("QUOTEBOOK")
      middle_section(
         "WELCOME TO QUOTEBOOK!\n\nBrowse #{Quote.all.count} QUOTES covering #{Genre.unique_genres.count} TOPICS\nall collected here for you to discover and get inspired. \n\nFind a quote you admire?\nAdd it to your FAVORITES to keep it forever...\n...or until you exit the program.\nWe haven't quite covered that yet!\n\nLet's get started! Please enter an option by name:\n\n(to EXIT, enter \"exit\")"
      )
      options_bar("RANDOM", "TOPICS", "FAVORITES")
   end

   def self.randomizer_window
      Screen.clear
      random_num = rand(0..119)
      one_quote_window(Quote.all[random_num])
      options_bar("ANOTHER", "FAVE", "MAIN")
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
      Genre.unique_genres
   end

   def self.my_favorites_window
      Screen.clear
      table = TTY::Table.new
      if Quote.favorites == []
         table << ["You have not collected any FAVORITES yet!"]
      else
         Quote.favorites.each_with_index do |quote, index|
            table << ["#{index+1}.", "#{quote.author.shorter_name.upcase} ", quote.shorter_quote]
         end
      end
      top_bar("FAVORITES")
      middle_section(
         table.render
      )
      options_bar("SELECT", "CLEAR", "MAIN")
      Quote.favorites
   end

   def self.exit_window
      Screen.clear
      top_bar("GOOD-BYE!")
      middle_section(
         "If you’re brave enough to say goodbye,\nlife will reward you with a new hello.\n\n-Paulo Coelho\n\n\nThank you for checking out\nmy first CLI program!\n\n-Cody\n\n:)"
      )
      sleep(6)
      Screen.clear
      exit!
   end

end