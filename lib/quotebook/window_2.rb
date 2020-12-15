module Screen
   def self.clear
       print "\e[2J\e[f"
   end
end

class Window_2

   include Screen

   # Window Parts

   def self.top_bar(message)
      box = TTY::Box.frame(width: 60, height: 4) do
         " #{DateTime.now.strftime("%b %d,/%Y %l:%M %p")}\n " + message
      end
      puts box
   end

   def self.middle_section(content)
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         content
      end
      puts box
      content
   end

   def self.bottom_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 4) do
         message
      end
      puts box
   end

   def self.options_bar(*options)
      options_string = ""
      options.each_with_index do |value, index|
         options_string += "#{index+1}. #{value} // "
      end
      box = TTY::Box.frame(width: 60, height: 4) do
         options_string
      end
      puts box
      options.count
   end

   # Common Windows

   def self.alert_window(message)
      Screen.clear
      top_bar("ALERT!")
      middle_section(message)
      bottom_bar
   end

   def self.quote_window(quote)
      Screen.clear
      top_bar("QUOTE")
      middle_section(
         "#{quote.text}\n-#{quote.author.name}"
      )
      bottom_bar("From: #{quote.genre.name}")
   end

   # CLI Windows

   def self.main_menu_window
      Screen.clear
      top_bar("MAIN MENU")
      middle_section(" [TO DO:] create welcome ")
      options_bar("RANDOM", "TOPICS", ["MY FAVORITES"])
   end

   def self.randomizer_window
      Screen.clear
      random_num = rand(0..119)
      quote_window(Quote.all[random_num])
      Quote.all[random_num]
      options_bar("ANOTHER!", "FAVE", "MAIN")
   end

   def self.topics_window
      Screen.clear
      top_bar("TOPICS")
      middle_section(

      )
   end

   def self.one_topic_window(topic)
      top_bar("#{topic.name}")
      middle_section(

      )
   end

   def self.my_favorites_window
      top_bar("MY FAVORITES")
      middle_section(

      )
      options_bar
   end

   def self.exit_window
   end

end