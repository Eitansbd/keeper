fish_types = [["Striped Bass", 81.89,  55],
              ["Bluefish", 31.75, 35],
              ["Fluke", 24.43, 38.25],
              ["Scup", 4.55, 19.68], 
              ["Blackfish", 28.81, 31.75]]
              
fish_types.each do |name, record_weight, record_length|
  FishType.create(name: name, 
                  record_weight: record_weight, 
                  record_length: record_length)
end