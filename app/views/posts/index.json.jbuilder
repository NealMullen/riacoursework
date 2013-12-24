json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :price
  json.url post_url(post, format: :json)
end
