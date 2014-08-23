json.array!(@sections) do |section|
  json.extract! section, :id, :professor, :time_slot, :place
  json.url section_url(section, format: :json)
end
