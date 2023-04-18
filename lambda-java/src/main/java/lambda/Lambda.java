package lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;

public class Lambda implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {
    private int fibonacci(int term) {
        if (term <= 1) {
            return term;
        } else {
            return fibonacci(term - 1) + fibonacci(term - 2);
        }
    }

    public APIGatewayProxyResponseEvent handleRequest(APIGatewayProxyRequestEvent event, Context context) {
        String stringTerm = event.getQueryStringParameters().get("term");
        int parsedTerm = Integer.parseInt(stringTerm);

        int result = fibonacci(parsedTerm);

        return new APIGatewayProxyResponseEvent()
            .withBody(String.format("Result: %d", result))
            .withStatusCode(200);
    }
}
