def search(graph, name)
  search_queue = Queue.new
  graph[name].each { |n| search_queue.push(n) }
  searched = []

  until search_queue.empty?
    person = search_queue.shift
    p person
    unless searched.include?(person)
      if person_is_seller(person)
        p "#{person} is a mango seller!"
        return true
      else
        graph[person].each { |n| search_queue.push(n) }
        searched << person
      end
    end
  end

  false
end

def person_is_seller(person)
  person == 'jonny'
end

# Ex. 1
graph = {}
graph['you'] = %w[alice bob claire]
graph['bob'] = %w[anuj peggy]
graph['alice'] = ['peggy']
graph['claire'] = %w[thom jonny]
graph['anuj'] = []
graph['peggy'] = []
graph['thom'] = []
graph['jonny'] = []

search(graph, 'you')
