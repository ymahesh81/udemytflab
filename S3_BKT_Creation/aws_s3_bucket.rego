package terraform
deny[msg] {
    changeset := input.resource_changes[_]
is_create_or_update(changeset.change.actions)
    changeset.type == "aws_s3_bucket"
    changeset.change.after.acl != "private"
    msg := sprintf("S3 bucket %v has a non-private acl", [
        changeset.name
    ])
}
is_create_or_update(actions) { actions[_] == "create" }
is_create_or_update(actions) { actions[_] == "update" }