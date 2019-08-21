json.extract! event, :id, :title, :held_on, :start_time, :starts_at, :ends_at, :created_at, :updated_at
json.url event_url(event, format: :json)
