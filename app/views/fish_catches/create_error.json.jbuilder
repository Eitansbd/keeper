errors = @fish_catch.errors
json.errors do
  json.weight errors[:weight] unless errors[:weight].empty? 
  json.length errors[:length] unless errors[:length].empty? 
  json.fish_type_id errors[:fish_type] unless errors[:fish_type].empty? 
  json.image_upload errors[:image] unless errors[:image].empty? 
end