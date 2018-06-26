json.array! @visits do |visit|
    json.extract! visit, :id, :account, :visitors
  end