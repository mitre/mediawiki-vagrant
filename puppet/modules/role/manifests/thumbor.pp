# == Class: role::thumbor
# Installs a Thumbor instance
#
class role::thumbor (
) {
    require ::role::varnish
    require ::role::statsd
    require ::role::sentry
    include ::apache::mod::proxy
    include ::apache::mod::proxy_http
    include ::apache::mod::headers
    include ::thumbor

    mediawiki::settings { 'thumbor-repo':
        values => template('role/thumbor/local_repo.php.erb'),
    }

    mediawiki::settings { 'thumbor':
        values => {
            'wgIgnoreImageErrors' => true,
        }
    }
}
