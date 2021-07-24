require_relative './Hero'
require_relative './Archer'
require_relative './Spearman'
require_relative './Swordsman'
# require_relative './Enemy'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin

marcher = Archer.new("Mongol Archer", 80, 40)
puts jin

jin = Spearman.new("Mongol Spearman", 120, 60)
puts jin

jin = Swordsman.new("Mongol Swordsman", 100, 50)
puts jin

# khotun = Enemy.new("Khotun Khan", 500, 50)
# puts khotun

# loop do
#     jin.attack(khotun)
#     puts khotun

#     khotun.attack(jin)
#     puts jin
# end



