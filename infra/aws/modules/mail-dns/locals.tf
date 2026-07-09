locals {
  mx_record_fqdn = (
    var.record_name == ""
    ? var.domain_name
    : "${var.record_name}.${var.domain_name}"
  )

  normalized_mx_records = [
    for record in var.mx_records : "${record.priority} ${trimsuffix(record.value, ".")}."
  ]
}