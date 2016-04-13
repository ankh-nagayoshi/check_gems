json.array!(@rubygems) do |rubygem|
  json.extract! rubygem, :id
  json.url rubygem_url(rubygem, format: :json)
end
