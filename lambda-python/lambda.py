def fibonacci(term):
    if term <= 1:
        return term
    else:
        return fibonacci(term - 1) + fibonacci(term - 2)


def handler(event, context):
    string_term = event["queryStringParameters"]["term"]
    parsed_term = int(string_term)

    result = fibonacci(parsed_term)

    return {
        "body": f"Result: {result}",
        "statusCode": 200,
    }
