json.array! @issues do |issue|
    json.extract! issue, :user_id, :created_at, :updated_at, :text
  end