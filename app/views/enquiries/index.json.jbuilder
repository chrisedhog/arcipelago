json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :enquiry_type, :message, :email
  json.url enquiry_url(enquiry, format: :json)
end
