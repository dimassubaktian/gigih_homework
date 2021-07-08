require_relative 'person'


class Hero < Person
    attr_accessor :deflect
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @deflect = 80
    end

    def take_damage(damage)
        if deflect?
            puts "#{@name} deflects the attack"
        elsif 
            @hitpoint -= damage
        end
        if dead?
            exit
        end
    end

    def deflect?
        return random <= 80
    end


    def random
        return rand(0..100)
    end
end