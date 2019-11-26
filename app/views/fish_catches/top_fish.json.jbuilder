json.fish @fish_catches do |fish|
  json.id fish.id
  json.weight fish.weight
  json.length fish.length
  
  json.angler do |user|
    json.id fish.user.id
    json.name fish.user.name
    json.url url_for(fish.user)
  end
  
  json.species do |species|
    json.name fish.fish_type.name
  end
end