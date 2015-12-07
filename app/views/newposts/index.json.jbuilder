json.array!(@newposts) do |newpost|
  json.extract! newpost, :id, :title, :description, :image_url, :keyword, :count
  json.url newpost_url(newpost, format: :json)
end
