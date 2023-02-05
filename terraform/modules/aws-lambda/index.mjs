import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import {
  DynamoDBDocumentClient,
  ScanCommand,
  PutCommand,
  GetCommand,
  DeleteCommand,
} from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});

const dynamo = DynamoDBDocumentClient.from(client);

const tableName = "db-ldatb-com";

'use strict'

export const handler = async function (event, context, callback) {
    let body;
    let statusCode = 200;
    const headers = {
        "Content-Type": "application/json",
    };
    
    try {
        let query = await dynamo.send(
            new GetCommand({
                TableName: tableName,
                Key: {
                    key: 'visitors',
                },
            })
        );
        
        let visitors = parseInt(query.Item.value) + 1
        
        await dynamo.send(
            new PutCommand({
                TableName: tableName,
                Item: {
                      key: 'visitors',
                      value: visitors
                },
            })
        );
        body = {"visitors": visitors};

    } catch (err) {
        statusCode = 400;
        body = err.message;
    } finally {
        body = JSON.stringify(body);
    }

    let response = {
        statusCode,
        body,
        headers,
    }
    
    callback(null, response);
};
