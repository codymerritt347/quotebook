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

   def self.bottom_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 4) do
         message
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
      options_string = ""
      options.each {|v| options_string += "  #{v}    |  "}
      box = TTY::Box.frame(width: 60, height: 4) do
         options_string
      end
      puts box
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
         "#{quote.text}\n\n-#{quote.author.name}"
      )
      bottom_bar("From: #{quote.genre.name.upcase}")
   end

   def self.one_topic_window(topic = "age")
      Screen.clear
      table = TTY::Table.new
      counter = 1
      Quote.all.each do |quote|
         if quote.genre.name == topic
            table << ["#{counter}.", quote.author.name]
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
      middle_section(" [TO DO:] create welcome ")
      options_bar("RANDOM", "TOPICS", "MY FAVORITES")
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
         table << ["#{index + 1}.", value.upcase]
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
      top_bar("MY FAVORITES")
      middle_section(

      )
      options_bar("CLEAR", "TOPICS", "MAIN MENU")
   end

   def self.exit_window
      Screen.clear
      top_bar("GOODBYE!")
      middle_section(

      )
      bottom_bar
      exit!
   end

end