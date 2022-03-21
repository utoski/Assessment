# Key-Pair

resource "aws_key_pair" "testi-keypair" {
  key_name   = "testi-keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
