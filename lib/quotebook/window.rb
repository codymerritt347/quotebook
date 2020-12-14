class Window
   @@data = []

   def self.data
      @@data
   end

   # BANNERS

   def self.time_banner(message)
      box = TTY::Box.frame(width: 60, height: 4) do
         " #{DateTime.now.strftime("%b %d,/%Y %l:%M %p")}\n " + message
      end
      puts box
   end

   def self.reg_banner(message)
      box = TTY::Box.frame(width: 60, height: 4) do
         " " + message
      end
      puts box
   end

   def self.bottom_banner(a,b,c,x,y,z)
      table = TTY::Table.new
      table << ["#{a}. #{x}","#{b}. #{y}","#{c}. #{z}"]
      puts table.render(:unicode, alignment: [:center], width: 60, resize: true)
   end

   # MAIN WINDOWS

   def self.message_window(message)
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         message
      end
      puts box
   end

   def self.quote_window(quote)
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 3, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         "#{quote.text}\n\n-#{quote.author.name}"
      end
      puts box
   end

   def self.browse_window
      table = TTY::Table.new
      Genre.unique_genres.each_with_index do |genre,index|
         table << ["#{index+1}.", genre.capitalize]
      end
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         table.render
      end
      puts box
   end

   def self.genre_window(genre)
      table = TTY::Table.new
      counter = 1
      Quote.all.each do |quote|
         if quote.genre.name == genre
            table << [counter, quote.author.name, quote.shorter_quote]
            counter += 1
         end
      end
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         table.render
      end
      puts box
   end

   def self.favorites_window
      table = TTY::Table.new
      Quote.favorites.each_with_index do |quote, index|
         table << ["#{index+1}. ", "#{quote.author.name}: ", quote.shorter_quote]
      end
      box = TTY::Box.frame(width: 60, height: 20, border: :thick, padding: 2, align: :center, title: {top_left: "\"", bottom_right: "\""}) do
         table.render
      end
      puts box
   end

end