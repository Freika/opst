maps = [
  { name: 'Temple of Anubis', kind: 1 },
  { name: 'Hanamura', kind: 1 },
  { name: 'Volskaya Industries', kind: 1 },
  { name: 'Watchpoint: Gibraltar', kind: 2 },
  { name: 'Dorado', kind: 2 },
  { name: 'Route 66', kind: 2 },
  { name: 'Lijiang Tower', kind: 3 },
  { name: 'Ilios', kind: 3 },
  { name: 'Nepal', kind: 3 },
  { name: 'King\'s Row', kind: 4 },
  { name: 'Numbani', kind: 4 },
  { name: 'Hollywood', kind: 4 },
  { name: 'Eichenwalde', kind: 4 },
  { name: 'Oasis', kind: 3 },
  { name: 'Horizon Lunar Colony', kind: 1 }
]

maps.each do |map|
  Map.find_or_create_by!(map)
end

p 'Maps.created'

heroes = [
  { name: 'Genji' },
  { name: 'McCree' },
  { name: 'Pharah' },
  { name: 'Reaper' },
  { name: 'Soldier 76' },
  { name: 'Sombra' },
  { name: 'Tracer' },
  { name: 'Bastion' },
  { name: 'Hanzo' },
  { name: 'Junkrat' },
  { name: 'Mei' },
  { name: 'Torbjorn' },
  { name: 'Widowmaker' },
  { name: 'D.Va' },
  { name: 'Reinhardt' },
  { name: 'Roadhog' },
  { name: 'Winston' },
  { name: 'Zarya' },
  { name: 'Ana' },
  { name: 'Lucio' },
  { name: 'Mercy' },
  { name: 'Symmetra' },
  { name: 'Zenyatta' },
  { name: 'Orisa' }
]

heroes.each do |hero|
  Hero.find_or_create_by!(hero)
end

p 'Hero.created'

# Season.find_or_create_by!(name: '3rd season')
