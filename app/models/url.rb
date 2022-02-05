class HttpUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      begin
        url = URI.parse(value)
        if not url.host
          raise URI::InvalidURIError
        end
      rescue URI::InvalidURIError
        record.errors.add(attribute, "is not a valid HTTP URL")
      end
    end
  end
end

class Url < ApplicationRecord
  validates :destination, presence: true, http_url: true
  validates :short, presence: true, length: { minimum: 6 , maximum: 10}
end