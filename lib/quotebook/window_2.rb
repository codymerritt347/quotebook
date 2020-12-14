class Window_2

   @@return_data = []

   def self.return_data
      @@return_data
   end

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
   end

   def self.bottom_bar(message = "")
      box = TTY::Box.frame(width: 60, height: 4) do
         message
      end
      puts box
   end

   # Common Windows

   def self.quote_window(quote)
      top_bar("QUOTE:")
      middle_section(
         "#{quote.text}\n-#{quote.author.name}"
      )
      bottom_bar("From: #{quote.genre.name}")
   end

   def self.alert_window(message)
   end

   # CLI Windows

   def self.welcome_window
   end

   def self.main_menu_window
   end

   def self.randomizer_window
   end

   def self.topics_window
   end

   def self.one_topic_window(topic)
   end

   def self.my_favorites_window
   end

   def self.exit_window
   end

end