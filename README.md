# Cloud4Future EKS (Fargate) – Full CI/CD (Infra + App)

This repo provisions a secured EKS cluster **on Fargate** (no EC2 node groups), builds a Node.js Docker image,
runs **Trivy image scanning (fail on HIGH/CRITICAL)**, pushes to **ECR**, and deploys to **EKS**.

## Secrets Required (GitHub → Settings → Secrets and variables → Actions)
- `AWS_REGION` e.g. `eu-west-2`
- `AWS_ROLE_ARN` your OIDC deploy role ARN (example: arn:aws:iam::<acct>:role/github-actions-deploy-role)
- `TF_STATE_BUCKET` S3 bucket name for terraform state (must already exist)
- `TF_STATE_KEY` e.g. `cloud4future/eks-fargate/terraform.tfstate`
- `EKS_CLUSTER_NAME` (optional, otherwise defaults to `cloud4future-eks-fargate`)

## What happens on push
- `infra.yml`: terraform init/plan/apply
- `app.yml`: docker build → trivy scan → push to ECR → kubectl deploy

## Notes
- Uses `Service type: LoadBalancer` with an **NLB** (no ALB controller needed).
- The Node.js image uses `npm install --omit=dev` with `overrides` to pull patched transitive deps.
