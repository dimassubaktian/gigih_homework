class Game
    def initialize(playable_heroes, heroes, villains)
        @playable_heroes = playable_heroes
        @heroes = heroes
        @villains = villains
    end

    def start
        
        i = 1

        until ((@playable_heroes.empty? && @heroes.empty?) || @villains.empty?) do
            puts "========== Turn #{i} ========"
            puts "\n"

            @playable_heroes.each do |hero|
                puts hero
            end
            @heroes.each do |hero|
                puts hero
            end
            puts "\n"

            @villains.each do |villain|
                puts villain
            end
            puts "\n"

            # to check is the hero dead or not and delete from array   
            @playable_heroes.each do |hero|
                @playable_heroes.delete(hero) if hero.dead?
            end 
            @heroes.each do |hero|
                @heroes.delete(hero) if hero.dead?
            end
            puts "\n"

            @playable_heroes.each do |hero|
                    puts "As #{hero.name}, what do you want to this turn?"
                    puts "1) Attack an enemy"
                    puts "2) Heal an ally"
                    option = gets.chomp.to_i
                    puts "\n"

                    if option == 1
                        puts "Which enemy you want to attack?"
                        j = 0
                        @villains.each do |villain|
                            puts "#{j}) #{villain.name}"
                            j += 1
                        end
                        enemy = gets.chomp.to_i
                        puts "\n"     
                        if enemy < @villains.size
                            hero.attack(@villains[enemy])
                        else
                            puts "The option you choose does not exist, you will be skipped on this turn"
                        end  
                    elsif option == 2
                        puts "Which ally you want to heal?"
                        j = 0
                        @heroes.each do |hero|
                            puts "#{j}) #{hero.name}"
                            j += 1
                        end
                        ally = gets.chomp.to_i
                        puts "\n"
                        if ally > 0 && ally < @heroes.size
                            @heroes[ally].heal_hero                
                        else
                            puts "The option you choose does not exist, you will be skipped on this turn"
                        end
                    else
                        puts "The option you choose does not exist, you will be skipped on this turn"
                    end
                    puts "\n"

                # check remove villain from villains
                @villains.each do |villain|
                    @villains.delete(villain) if villain.dead? || villain.flee?
                end
                puts "\n"

                # check is any villains litfe
                if @villains.empty?
                    puts "Heroes win"
                    exit
                end
            end

            # do heroes attack
            @heroes.each do |hero|
                
                hero.attack(@villains[rand(@villains.size)])

                # check remove villain from villains
                @villains.each do |villain|
                    @villains.delete(villain) if villain.dead? || villain.flee?
                end
                puts "\n"

                # check is any villains litfe
                if @villains.empty?
                    puts "Heroes win"
                    exit
                end
            end

            
            # do villains attack
            @villains.each do |villain|
                villain.attack(@heroes[rand(@heroes.size)])
            end

            puts "\n"

            i += 1
            
            # cek is any hero life
            if @heroes.empty?
                puts "Enemy win"
            end
        end
    
    end
end