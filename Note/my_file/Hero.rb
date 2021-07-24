require_relative './Person'


class Hero < Person
    attr_reader :deflect
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage      
        @deflect = 80
    end
end