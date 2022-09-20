terraform {

}

provider "aws" {
  region     = "eu-central-1"
  access_key = ""
  secret_key = ""
}


provider "aws" {
  alias      = "north-virginia"
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
