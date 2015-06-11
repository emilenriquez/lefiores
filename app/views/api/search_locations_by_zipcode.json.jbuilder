json.array!(@locations) do |location|
  #json.extract! game, :id, :title, :slug
  ##json.url '/aaa'
  json.value location.name
  json.id location.id.to_s
end

