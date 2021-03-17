# Welcome to your CDK C# project!

This is a blank project for C# development with CDK.

The `cdk.json` file tells the CDK Toolkit how to execute your app.

It uses the [.NET Core CLI](https://docs.microsoft.com/dotnet/articles/core/) to compile and execute your project.

## Useful commands

* `dotnet build src` compile this app
* `cdk deploy`       deploy this stack to your default AWS account/region
* `cdk diff`         compare deployed stack with current state
* `cdk synth`        emits the synthesized CloudFormation template

## After cdk deployed

login to ec2 via Session Manager.

make sure you can run docker.

```shell
docker run --rm hello-world
```

run command to bench.

```sh
git clone https://github.com/LesnyRumcajs/grpc_bench.git
cd grpc_bench
./build.sh csharp_grpc_bench
./bench.sh csharp_grpc_bench
cat ./results/210803T060439/chsrap_grpc_bench.report

```