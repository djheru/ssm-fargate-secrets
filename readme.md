```bash
export CLUSTER_NAME=ecs-cluster
export CLUSTER_FILE=aws/cluster.cloudformation.yml
export SERVICE_NAME=ecs-service
export SERVICE_FILE=aws/service.cloudformation.yml
export SERVICE_PARAMETERS_FILE=aws/service-parameters.cloudformation.json

# Create Network Stack 
export CLUSTER_STACK_ARN=$(aws cloudformation create-stack \
    --stack-name $CLUSTER_NAME \
    --template-body file://$CLUSTER_FILE \
    --capabilities CAPABILITY_IAM \
    --output text \
    --query 'StackId') && echo $CLUSTER_STACK_ARN

# Create Service Stack
export SERVICE_STACK_ARN=$(aws cloudformation create-stack \
    --stack-name $SERVICE_NAME \
    --template-body file://$SERVICE_FILE \
    --parameters file://$SERVICE_PARAMETERS_FILE \
    --capabilities CAPABILITY_IAM \
    --output text \
    --query 'StackId') && echo $SERVICE_STACK_ARN
    
# Update Service Stack
aws cloudformation update-stack \
    --stack-name $SERVICE_NAME \
    --template-body file://$SERVICE_FILE \
    --parameters file://$SERVICE_PARAMETERS_FILE \
    --capabilities CAPABILITY_IAM \
    --output text \
    --query 'StackId'

```
