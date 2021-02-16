@processed = []

def cheapest(graph)
  p "Graph: #{graph}"

  costs = extract_costs(graph)
  parents = extract_parents(graph)

  lowest_cost_node = find_lowest_cost_node(costs)

  while lowest_cost_node
    cost = costs[lowest_cost_node]
    neighbours = graph[lowest_cost_node]

    neighbours.each do |node, neighbour_cost|
      new_cost = cost + neighbour_cost

      next unless costs[node] > new_cost

      puts "Minimum total cost is #{new_cost} for node #{node}"

      costs[node] = new_cost
      parents[node] = lowest_cost_node
    end

    @processed << lowest_cost_node
    lowest_cost_node = find_lowest_cost_node(costs)
  end

  costs['finish']
end

def find_lowest_cost_node(costs)
  lowest_cost = Float::INFINITY
  lowest_cost_node = nil

  costs.each do |node, cost|
    if cost < lowest_cost && !@processed.include?(node)
      lowest_cost = cost
      lowest_cost_node = node
    end
  end

  puts "Current lowest-cost-node is -> #{lowest_cost_node}" if lowest_cost_node

  lowest_cost_node
end

def extract_costs(graph)
  costs = {}
  graph.each_key do |key|
    graph[key].each { |skey, value| (costs[skey] = value) } if key == 'start'
    next if key == 'start' || costs.key?(key)

    costs[key] = Float::INFINITY
  end
  costs
end

def extract_parents(graph)
  parents = {}
  graph.each_key { |key| parents[key] = [] unless key == 'start' }

  graph.each do |key, value|
    value.each_key { |hkey| parents[hkey] << key }
  end
  parents
end

# Ex. 1
graph = {
  'start' => { '1' => 5, '2' => 2 },
  '1' => { '3' => 4, '4' => 2 },
  '2' => { '1' => 8, '4' => 7 },
  '3' => { '4' => 6, 'finish' => 3 },
  '4' => { 'finish' => 1 },
  'finish' => {}
}

# Ex. 2
# graph = {
#   'start' => { '1' => 10 },
#   '1' => { '2' => 20 },
#   '2' => { '3' => 1, 'finish' => 30 },
#   '3' => { '1' => 1 },
#   'finish' => {}
# }

cheapest(graph)
