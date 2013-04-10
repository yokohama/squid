json.array!(@information) do |information|
  json.extract! information, :title
  json.url information_url(information, format: :json)
end