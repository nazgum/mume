module Util

   # wrap displayed strings at max_length columns
   def self.wrap(str)
      result = ""
      max_length = 62
      len = 0

      # split up the string by words
      str.split(" ").each do |w|

         # if the str length + next word if longer than max length
         # then start a new line \n, otherwise add a space " "
         if len + w.length() >= max_length
            result += "\n"
            len = 0
         elsif len > 0
            result += " "
         end

         len += w.length() 
         result += w
      end

      result
   end
end