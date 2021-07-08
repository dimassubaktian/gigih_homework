require_relative 'person'

class Enemy < Person
    def attack(other_person)
        if other_person.deflect?
            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
            puts "#{other_person.name} deflects the attack"
        elsif 
            other_person.take_damage(@attack_damage)

            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
    
            if other_person.hitpoint == 0
                puts other_person
                puts "#{other_person.name} dies"
                exit
            end
        end
    end
end