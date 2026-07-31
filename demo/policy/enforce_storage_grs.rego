package environment.hcl2
import rego.v1

# Policy: enforce_storage_grs
# Purpose: Deny any azurerm_storage_account that is not configured with GRS replication.
# Enforcement: Blocking (deny)

deny contains msg if {
    some file_idx
    file_element := input[file_idx]

    some account_name, account_configs in file_element.contents.resource.azurerm_storage_account
    some config in account_configs

    config.account_replication_type != "GRS"

    msg := sprintf(
        "[STORAGE GRS - DENY] Storage account %q in %s must use account_replication_type = \"GRS\" (got %q). GRS is required for geo-redundancy and business continuity.",
        [account_name, file_element.path, config.account_replication_type]
    )
}
