require_relative 'person'


class Hero < Person
    attr_reader :deflect
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
        die?
    end

    def deflect?
        return random <= 80
    end

    def heal_hero
        @hitpoint += 20
        puts "Jin Sakai heals #{@name}, restoring 20 hitpoints. now #{@name} has #{@hitpoint} hitpoints"
    end


    def random
        return rand(0..100)
    end
end