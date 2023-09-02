require './lib/dish'

class Potluck

    attr_reader :date, :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        dishes << dish
    end

    def get_all_from_category(category)
        dishes.find_all {|dish| dish.category == category}
    end

    def menu
        group = dishes.group_by {|dish| dish.category}
        menu = Hash.new{|h,key| h[key] = []}
        group.each do |category, dishes|
            dishes.each do |dish|
                menu[category] << dish.name
            end
        end
        menu
    end

    def ratio(category)
        num = get_all_from_category(category).length
        den = dishes.count
        (num.to_f / den)*100.round(1)
    end
end

