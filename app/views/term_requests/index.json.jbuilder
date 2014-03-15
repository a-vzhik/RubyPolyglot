json.array!(@term_requests) do |term_request|
  json.extract! term_request, :id, :datetime, :term
  json.url term_request_url(term_request, format: :json)
end
