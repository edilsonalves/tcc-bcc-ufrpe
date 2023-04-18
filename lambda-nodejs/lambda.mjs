const fibonacci = (term) => {
  if (term <= 1) {
    return term;
  } else {
    return fibonacci(term - 1) + fibonacci(term - 2);
  }
};

export const handler = async (event, context) => {
  const stringTerm = event.queryStringParameters.term;
  const parsedTerm = parseInt(stringTerm);

  const result = fibonacci(parsedTerm);

  return {
    body: `Result: ${result}`,
    statusCode: 200,
  };
};
