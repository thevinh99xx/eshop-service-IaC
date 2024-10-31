terraform {
  backend "s3" {
    bucket = "<<개인 버킷>>"           # 개인이 생성한 S3 버킷의 실제 이름 ex) bucket = t3msp
    key    = "service/terraform.tfstate" # service 인프라의 tfstate 파일 저장 path(고정값)
    3번째 라인의 <<개인 버킷>> 변수를 개인이 생성한 실제 버킷명으로 치환 후 현재 5번째 라인도 같이 삭제합니다. ex) bucket = "t3msp" -- (provider.tf 3번째 라인 bucket값 치환 && 현재 5번째 라인 전체 삭제)
    region = "us-east-1"              # S3가 존재하는 region
    skip_s3_checksum=true             # Terraform 1.6 이상부터 추가 파라메터
    skip_requesting_account_id=true   # Terraform 1.6 이상부터 추가 파라메터
  }
  required_version = ">=1.1.3"
}

provider "aws" {
  region = var.aws_region
}
