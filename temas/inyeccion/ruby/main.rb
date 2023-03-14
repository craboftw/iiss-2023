require 'artii'

def slay(size)
  a = Artii::Base.new :font => 'slant'
  line = a.asciify("SLAY !")
  puts line
end

slay(5)
