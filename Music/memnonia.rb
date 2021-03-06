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
3.times do |i|
  lead_p1 += [np([:As,4], :dorian, :l=>16, :v=>0.99)[7-i,5-i,7-i], n(:R, :l=>16)]
end
lead_p2 = [np([:As,4], :mixolydian, :l=>16, :v=>0.99)[6], n(:R, :l=>16), np([:A,4], :dorian, :l=>16, :v=>0.99)[6,4,2,4]]
lead_p3 = [np([:A,4], :dorian, :l=>16, :v=>0.99)[6], n(:R, :l=>16), np([:As,4], :dorian, :l=>16, :v=>0.99)[6,4,2], n(:R, :l=>16)]
lead_p4 = [np([:A,4], :mixolydian, :l=>16, :v=>0.99)[6], n(:R, :l=>16), np([:A,4], :dorian, :l=>16, :v=>0.99)[3,4,2], n(:R, :l=>16)]
lead_p5 = [np([:A,4], :dorian, :l=>16, :v=>0.99)[2], n(:R, :l=>16), np([:A,4], :dorian, :l=>16, :v=>0.99)[2,4,6], n(:R, :l=>16)]
lead = [lead_p1, lead_p2, lead_p3, lead_p2, lead_p3, lead_p2, lead_p4, lead_p5]

#.........................................................................................................
str 'lead' do
  c = (count - 1) % lead.length
  ch(0) << lead[c]
end

#.........................................................................................................
# rhythm
#.........................................................................................................
rhythm_p1 = [n(:R, :l=>2), n(:R, :l=>4)]
rhythm_p2 = [np([:A,4], :dorian, :l=>16, :v=>0.99)[6,4,2,4], n(:R, :l=>16)]
rhythm_p3 = [np([:As,4], :mixolydian, :l=>16, :v=>0.99)[6,4,2], n(:R, :l=>8), n(:R, :l=>16)]
rhythm_p4 = [np([:As,4], :dorian, :l=>16, :v=>0.99)[3,4,2], n(:R, :l=>8), n(:R, :l=>16)]
rhythm_p5 = [np([:As,4], :mixolydian, :l=>16, :v=>0.99)[2,4,6], n(:R, :l=>8), n(:R, :l=>16)]
rhythm_phrases =  [rhythm_p1, rhythm_p2, rhythm_p3, rhythm_p2, rhythm_p3, rhythm_p4, rhythm_p5]

#.........................................................................................................
str 'rhythm' do
  c = (count - 1) % rhythm_phrases.length
  ch(1) << rhythm_phrases
end

#.........................................................................................................
# perc
#.........................................................................................................
perc_p1 = [n([:C,5]), n(:R), n([:C,5]), n(:R)]
perc_phrases = [perc_p1]

#.........................................................................................................
str 'perc' do
  c = (count - 1) % perc_phrases.length
  ch(2) << perc_phrases
end

play