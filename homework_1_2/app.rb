require_relative 'person'
require_relative 'hero'
# require_relative 'enemy'
require_relative 'villain'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin


mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)

villains = [mongol_archer, mongol_spearman, mongol_swordsman]


i = 1

until (jin.dead? || villains.empty?) do
    puts "========== Turn #{i} ========"
    puts "\n"

    puts jin
    villains.each do |villain|
        puts villain
    end
    puts "\n"

    jin.attack(villains[rand(villains.size)])
    villains.each do |villain|
        villains.delete(villain) if villain.dead? || villain.flee?
    end

    puts "\n"

    villains.each do |villain|
        villain.attack(jin)
    end

    puts "\n"

    i += 1

    if villains.empty?
        puts "Jin Sakai Win"
    end
end
    


# khotun = Person.new("Khotun Khan", 500, 50)
# puts khotun


# loop do
#     jin.attack(khotun)
#     puts khotun

#     khotun.attack(jin)
#     puts jin
# end

