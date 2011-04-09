require 'rubygems'
require 'zgomot'

#.........................................................................................................
before_start do
  Zgomot.logger.level = Logger::DEBUG
end

#.........................................................................................................
# lead
#.........................................................................................................
lead_p1 = []
4.times do |i|
  lead_p1 << np([:As,4], :mixolydian, :l=>16, :v=>0.99)[i+1,i+2,i+3,i+4]
end
lead = [lead_p1]

#.........................................................................................................
str 'feature' do
  c = (count - 1) % lead.length
  ch(0) << lead[c]
end

play