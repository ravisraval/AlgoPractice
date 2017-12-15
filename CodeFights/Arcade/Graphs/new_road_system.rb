def newRoadSystem(roadRegister)
    roads = Hash.new(0)

    roadRegister.each_with_index do |road, road_idx|
        road.each_with_index do |boolean, bool_idx|
            next if road_idx == bool_idx
            if boolean
                roads[road_idx] += 1
                roads[bool_idx] -= 1
            end
        end
    end

    roads.all? { |k, v| v == 0 }
end
