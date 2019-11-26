module FishCatchesHelper
  def fish_type_options(fish_types)
    fish_types.map { |fish_type| [fish_type.name, fish_type.id] }
  end
end
