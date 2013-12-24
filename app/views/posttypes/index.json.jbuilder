json.array!(@posttypes) do |posttype|
  json.extract! posttype, :id, :name
  json.url posttype_url(posttype, format: :json)
end
