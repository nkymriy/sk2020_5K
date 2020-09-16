class JsonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # NOTE :strictをtrueにするとバリデーションが厳密になる
    # JSON::Validator.validate!(options[:schema], value, strict: true)
    JSON::Validator.validate!(options[:schema], value)
  rescue JSON::Schema::ValidationError => e
    record.errors[attribute] << (options[:message] || e.message)
  end
end