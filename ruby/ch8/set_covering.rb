require 'set'

def stations_covering_all_states(states_needed, stations)
  final_stations = Set.new

  until states_needed.empty?
    states_covered = Set.new

    stations.each do |station, states_for_station|
      covered = states_needed & states_for_station

      next if covered.length < states_covered.length

      best_station = station
      states_covered = covered
      final_stations << best_station
      states_needed -= states_covered
    end
  end

  final_stations
end

states_needed = Set['mt', 'wa', 'or', 'id', 'nv', 'ut', 'ca', 'az']

stations = {}
stations['kone'] = Set['id', 'nv', 'ut']
stations['ktwo'] = Set['wa', 'id', 'mt']
stations['kthree'] = Set['or', 'nv', 'ca']
stations['kfour'] = Set['nv', 'ut']
stations['kfive'] = Set['ca', 'az']

p stations_covering_all_states(states_needed, stations)
