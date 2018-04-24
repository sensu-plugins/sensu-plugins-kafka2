module CommonKafka
  def request
    RestClient::Request.execute(
      method: :get,
      url: config[:endpoint]
    )
  end

  def print_hash(hash, path = '')
    hash.each do |key, value|
      next if %w[unit event_type type].include?(key)
      new_path = "#{path}.#{key}"
      if value.is_a? Hash
        print_hash(value, new_path)
      else
        output metric_name: "#{config[:scheme]}#{new_path}", value: value
      end
    end
    false
  end
end
