using System.Collections.Generic;
using System.Threading.Tasks;

using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;


[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]

namespace DotNetFunction
{
    public class Lambda
    {
        private int fibonacci(int term)
        {
            if (term <= 1)
            {
                return term;
            }
            else
            {
                return fibonacci(term - 1) + fibonacci(term - 2);
            }
        }

        public async Task<APIGatewayProxyResponse> FunctionHandler(APIGatewayProxyRequest apigProxyEvent, ILambdaContext context)
        {
            var stringTerm = apigProxyEvent.QueryStringParameters["term"];
            int parsedTerm = int.Parse(stringTerm);

            int result = fibonacci(parsedTerm);

            return new APIGatewayProxyResponse
            {
                Body = $"Result: {result}",
                StatusCode = 200
            };
        }
    }
}
