variable "hcloud_token" {
    sensitive = true # Requires terraform >= 0.14
    #default = ""
}

variable "ssh_public_key_file" {
    description = "SSH public key file"
    default     = "~/.ssh/id_rsa.pub"
    type        = string
}
