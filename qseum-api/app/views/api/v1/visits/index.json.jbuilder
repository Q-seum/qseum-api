json.array! @visits do |visit|
    json.extract! visit, :id, :account, :user_id, :visitors, :date
  end