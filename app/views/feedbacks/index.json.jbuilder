json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :title, :description, :user_id
  json.url feedback_url(feedback, format: :json)
end
