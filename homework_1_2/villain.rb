require_relative 'person'

class Villain < Person
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage  
        @flee_percentage = 0.5
        @fleed = false    
    end

    def take_damage(damage)
        @hitpoint -= damage
        if @hitpoint > 0
            if @hitpoint <= 50 
                flee if rand < @flee_percentage
            end
        end       
    end

    def flee
        @fleed = true
        puts "#{@name} has fled the battlefield with #{hitpoint} hitpoint left"
    end

    def flee?
        @fleed
    end
end