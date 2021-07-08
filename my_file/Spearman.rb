require_relative './Person'


class Spearman < Person
    attr_reader :flee
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage      
        @flee = 50
    end
end