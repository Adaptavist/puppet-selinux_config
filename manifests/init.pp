class selinux_config (
    $mode    = 'enforcing',
    $modules = {},
    ) {

    validate_hash($modules)
    Class['selinux'] -> Selinux::Module<| |>
    if ! defined(Class['selinux']) {
        class { 'selinux':
            mode   => $mode,
        }
    }

    create_resources (selinux::module, $modules)
}
