def fibonacci(term)
  if term <= 1
    return term
  else
    return fibonacci(term - 1) + fibonacci(term - 2)
  end
end

def handler(event:, context:)
  string_term = event["queryStringParameters"]["term"]
  parsed_term = string_term.to_i

  result = fibonacci(parsed_term)

  return {
    body: "Result: #{result}",
    statusCode: 201,
  }
end
