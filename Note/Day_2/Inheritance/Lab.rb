require_relative './Dog'

class Lab < Dog
    def  initialize(breed, name)
        super(breed)
        @name = name
    end

    def to_s
        "{#@breed, #@name}"
    end

    def bark
        super()
        puts "woof woof lab"
    end
end