class kubernetes_addons::influxdb(
  $image=$::kubernetes_addons::params::influxdb_image,
  $version=$::kubernetes_addons::params::influxdb_version,
  Enum['present', 'absent'] $ensure = 'present',
) inherits ::kubernetes_addons::params {
  require ::kubernetes

  kubernetes::apply{'heapster-influxdb':
    ensure    => $ensure,
    manifests => [
      template('kubernetes_addons/influxdb-svc.yaml.erb'),
      template('kubernetes_addons/influxdb-deployment.yaml.erb'),
    ],
  }
}
