output "ebs_arn" {
    value = aws_ebs_volume.data-vol.arn
}

output "ebs_id" {
    value = aws_ebs_volume.data-vol.id
}

output "ebs_snapshotid" {
    value = aws_ebs_volume.data-vol.snapshot_id
}

output "ebs_availabiltyzone" {
    value = aws_ebs_volume.data-vol.availability_zone
}

output "ebs_type" {
    value = aws_ebs_volume.data-vol.type
}

output "efs_arn" {
    value = aws_efs_file_system.efs.arn
}

output "efs_id" {
    value = aws_efs_file_system.efs.id
}

output "efs_avz_id" {
    value = aws_efs_file_system.efs.availability_zone_id
}

output "efs_dns_name" {
    value = aws_efs_file_system.efs.dns_name
}