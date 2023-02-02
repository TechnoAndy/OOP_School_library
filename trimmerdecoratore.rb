require_relative('./basedecorator')

class TrimmerDecorator
    def correct_name
        name = @nameable.correct_name 
        name.slic(0, 10) if name.length > 10
    end
end
