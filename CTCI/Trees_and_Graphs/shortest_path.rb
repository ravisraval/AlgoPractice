#find the shortest path between a source and a destination node

def bidirectional_search(source_node, destination_node)
  current_first = source_node
  current_second = destination_node

  first_search_current_nodes = [current_first]
  second_search_current_nodes = [current_second]
  path_steps_taken = 0

  return path_steps_taken if current_first == current_second

  loop do
    path_steps_taken += 1

    current_first.children.each do |child|
      return child if second_search_current_nodes.include?(child)
      first_search_current_nodes.push(child)
    end

    path_steps_taken += 1

    current_second.children.each do |child|
      return child if first_search_current_nodes.include?(child)
      second_search_current_nodes.push(child)
    end

  end

  return 'no intersection'
end


  end



end
