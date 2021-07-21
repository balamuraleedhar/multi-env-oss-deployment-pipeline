# Test our IAM Roles attached policies and availability
describe aws_iam_role(role_name: input("CodePipelineRole")) do
  it { should exist }
end

# Test our IAM Policy and ensure that it has the necessary statements
describe aws_iam_policy(policy_name: input("CodePipelineBase")) do
  it { should_not have_statement(Action: 'kms:*') }
  it { should_not have_statement(Action: 'iam:*') }
  it { should have_statement(Action: 'codepipeline:*') }
  it { should be_attached_to_role('cassis-CodePipelineRole') }
  it { should exist }
end
