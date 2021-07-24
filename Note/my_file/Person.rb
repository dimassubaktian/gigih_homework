class Person
    attr_accessor :hitpoint
    attr_reader :name, :attack_damage, :deflect

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage      
    end

    def to_s

        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
        
    end

    def attack(other_person)

        r = deflact_chance

        f = flee_chance

        if r <= other_person.deflect && other_person.deflect > 0
            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
            puts "#{other_person.name} deflects the attack"
        else
            other_person.take_damage(@attack_damage)

            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
    
            if other_person.hitpoint == 0
                puts other_person
                puts "#{other_person.name} dies"
                exit
            end
        end
 
    end

    def deflact_chance 
        return rand(1..100)
    end

    def flee_chance 
        return rand(1..100)
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    
end



# un used code 
    # hit_effect(other_person, attack_damage) 


    # def hit_effect(person, damage)
    #     person.hitpoint = person.hitpoint - damage        
    # end

    # def check_hitpoint(person)
    #     if person.hitpoint > 0
            
    #     else
            
    #     end
    # end