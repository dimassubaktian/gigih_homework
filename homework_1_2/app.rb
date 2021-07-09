require_relative 'person'
require_relative 'hero'
# require_relative 'enemy'
require_relative 'villain'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'



jin = Hero.new("Jin Sakai", 100, 50)
yuna = Hero.new("Yuna", 90, 45)
sensei = Hero.new("Sensi Ishikawa", 80, 60)
heroes = [jin, yuna, sensei]


mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)

villains = [mongol_archer, mongol_spearman, mongol_swordsman]


i = 1

until (heroes.empty? || villains.empty?) do
    puts "========== Turn #{i} ========"
    puts "\n"

    heroes.each do |hero|
        puts hero
    end
    puts "\n"
    villains.each do |villain|
        puts villain
    end
    puts "\n"

    heroes.each do |hero|
        heroes.delete(hero) if hero.dead?
    end
    puts "\n"

    heroes.each do |hero|
        if hero == heroes[0]
            puts "As Jin Sakai, what do you want to this turn?"
            puts "1) Attack an enemy"
            puts "2) Heal an ally"
            option = gets.chomp.to_i
            puts "\n"

            if option == 1
                puts "Which enemy you want to attack?"
                j = 0
                villains.each do |villain|
                    puts "#{j}) #{villain.name}"
                    j += 1
                end
                enemy = gets.chomp.to_i
                puts "\n"     
                if enemy < villains.size
                    hero.attack(villains[enemy])
                else
                    puts "The option you choose does not exist, you will be skipped on this turn"
                end  
            elsif option == 2
                puts "Which ally you want to heal?"
                j = 1
                heroes.each do |hero|
                    if hero != heroes[0]
                        puts "#{j}) #{hero.name}"
                        j += 1
                    end
                end
                ally = gets.chomp.to_i
                puts "\n"
                if ally > 0 && ally < heroes.size
                    heroes[ally].heal_hero                
                else
                    puts "The option you choose does not exist, you will be skipped on this turn"
                end
                puts "\n"
            else
                puts "The option you choose does not exist, you will be skipped on this turn"
            end
            puts "\n"
        else
            hero.attack(villains[rand(villains.size)])
        end

        # check remove villain from villains
        villains.each do |villain|
            villains.delete(villain) if villain.dead? || villain.flee?
        end
        puts "\n"
        if villains.empty?
            puts "Heroes win"
            exit
        end
    end

    

    villains.each do |villain|
        villain.attack(heroes[rand(heroes.size)])
    end

    puts "\n"

    i += 1

    if heroes.empty?
        puts "Enemy win"
    end
end
    






#########################################
# Old Stuff
#########################################
        # jin.attack(villains[rand(villains.size)])

# i = 1

# until (jin.dead? || villains.empty?) do
#     puts "========== Turn #{i} ========"
#     puts "\n"

#     puts jin
#     villains.each do |villain|
#         puts villain
#     end
#     puts "\n"

#     jin.attack(villains[rand(villains.size)])
#     villains.each do |villain|
#         villains.delete(villain) if villain.dead? || villain.flee?
#     end

#     puts "\n"

#     villains.each do |villain|
#         villain.attack(jin)
#     end

#     puts "\n"

#     i += 1

#     if villains.empty?
#         puts "Jin Sakai Win"
#     end
# end

# puts "Enter your name: "
# name = gets.chomp
# puts "Hello #{name}, how are you"

# khotun = Person.new("Khotun Khan", 500, 50)
# puts khotun


# loop do
#     jin.attack(khotun)
#     puts khotun

#     khotun.attack(jin)
#     puts jin
# end

