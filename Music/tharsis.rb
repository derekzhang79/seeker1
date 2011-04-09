require 'rubygems'
require 'zgomot'

#.........................................................................................................
before_start do
  Zgomot.logger.level = Logger::DEBUG
end

#.........................................................................................................
# completed
#.........................................................................................................
completed_p1 = [np([:C,5], :mixolydian, :l=>8, :v=>0.99)[4,6,2], n(:R, :l=>8)]
completed_p2 = [np([:D,5], :aeolian, :l=>16, :v=>0.99)[4,5,6], n(:R, :l=>16), np([:D,5], :aeolian, :l=>16, :v=>0.99)[6], n(:R, :l=>16)]
completed_p3 = [np([:D,5], :aeolian, :l=>16, :v=>0.99)[5,4,2], n(:R, :l=>16)]
completed_p4 = [np([:C,5], :mixolydian, :l=>8, :v=>0.99)[3,1,3], n(:R, :l=>8)]
completed = [completed_p1, completed_p2, completed_p3, completed_p4]

#.........................................................................................................
str 'completed' do
  c = (count - 1) % completed.length
  ch(0) << completed[c]
end

play