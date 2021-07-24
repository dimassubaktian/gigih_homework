require_relative './Person'

class Enemy < Person
    attr_reader :deflect
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage      
        @deflect = 0
    end
end

