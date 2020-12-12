class Artwork

   def self.display_logo
      puts "
      ░██████╗░██╗░░░██╗░█████╗░████████╗███████╗██████╗░░█████╗░░█████╗░██╗░░██╗
      ██╔═══██╗██║░░░██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░██╔╝
      ██║██╗██║██║░░░██║██║░░██║░░░██║░░░█████╗░░██████╦╝██║░░██║██║░░██║█████═╝░
      ╚██████╔╝██║░░░██║██║░░██║░░░██║░░░██╔══╝░░██╔══██╗██║░░██║██║░░██║██╔═██╗░
      ░╚═██╔═╝░╚██████╔╝╚█████╔╝░░░██║░░░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░╚██╗
      ░░░╚═╝░░░░╚═════╝░░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝
      ".colorize(:light_blue)
   end

   def self.display_banner
      puts "
             .:+oossssssssssssssssssssssss`:+oo/-    -+oo+:      
             :os/-.`                        +oooooo-  :oooooo/     
           .os:                             /oooooo:  -ooooooo     
          .so`                               -////o`   .:///o-     
          +s.                                  `:+.       -+-      
          ss                                 `::.       :/-        
          ss                                                -+-    
          ss          Welcome to Quotebook!                 :s:    
          ss          Find a little inspiration             :s:    
          ss          from some of the world's              :s:    
          ss          greatest thinkers.                    :s:    
          ss                                                :s:    
          ss                               -Cody M.         :s:    
          oo   `         `                                  :s:    
            .//-      `:/-`                                 :s:    
           //`       -+.                                    os.    
          /o+oo+:   -o+ooo/`                              `+s:     
          ooooooo:  /oooooo+                            `:oo-      
          :oooooo-  .oooooo/  `......................-:+so:        
           `://:`    `-//:.   .++++++++++++++++++++++/:-`          
      ".colorize(:light_cyan)
   end

end