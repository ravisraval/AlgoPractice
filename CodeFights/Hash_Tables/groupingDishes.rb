def groupingDishes(dishes)
    hsh = Hash.new { |h,k| h[k] = []}
    meals = {}

    dishes.each do |dish|
        meal = dish[0]

        dish[1..-1].each do |ingred|
            # next if ingred == meal
            hsh[ingred].push(meal)
        end
    end

    hsh.select! { |k, v| v.length > 1 }
    hsh.values.each do |value|
        value.sort!
    end

    hsh.sort.map { |ingred_row| ingred_row.flatten }
end
