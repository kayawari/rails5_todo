json.extract! todo, :id, :checked_flg, :title, :memo, :ins_time, :created_at, :updated_at
json.url todo_url(todo, format: :json)