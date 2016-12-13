json.extract! todo, :id, :checked_flg, :title, :memo, :duedate, :created_at, :updated_at
json.url todo_url(todo, format: :json)
