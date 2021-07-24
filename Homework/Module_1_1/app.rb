require_relative './person'

jin = Person.new("Jin Sakai", 100, 50, 80)
puts jin

khotun = Person.new("Khotun Khan", 500, 50, 0)
puts khotun

loop do
    jin.attack(khotun)
    puts khotun

    khotun.attack(jin)
    puts jin
end