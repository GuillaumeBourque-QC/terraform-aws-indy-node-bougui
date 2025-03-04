output "node_info" {
  value = [
    # The node's public IP address.  Used by Ansible for configuring the node.
    aws_instance.indy_node.public_ip,
    # data_volume_id
    aws_ebs_volume.data_volume.id,
    # node_seed
    # Remove special characters and crop to into a 32 character seed.
    substr(replace(replace(random_id.node_seed.b64_url, "_", ""), "-", ""), 0, 32),
    # The node's public Client IP.   Used later on for automatic genesis file generation
    aws_eip.public_client_ip[0].public_ip,
    # The node's public Node IP.  Used later on for automatic genesis file generation.  
    # Should be the same as the first output, but we are putting this here anyay for clarity.
    aws_eip.public_node_ip[0].public_ip
  ]
}
