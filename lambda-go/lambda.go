package main

import (
	"fmt"
	"strconv"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func fibonacci(term int) int {
	if term <= 1 {
		return term
	} else {
		return fibonacci(term-1) + fibonacci(term-2)
	}
}

func handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	stringTerm := request.QueryStringParameters["term"]
	parsedTerm, _ := strconv.Atoi(stringTerm)

	result := fibonacci(parsedTerm)

	return events.APIGatewayProxyResponse{
		Body:       fmt.Sprintf("Result: %d", result),
		StatusCode: 200,
	}, nil
}

func main() {
	lambda.Start(handler)
}
