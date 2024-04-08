project(
  'meson-test', 'c', 'cython',
  meson_version: '>= 1.1',
  default_options: [
    'buildtype=debugoptimized',
    'c_std=c99',
  ]
)

gmp_version = get_option('gmp_version')
mpfr_version = get_option('mpfr_version')

if gmp_version == ''
  gmp_dep = dependency('gmp', version: '>= 6.2.1')
  extension_kwargs = {}
else
  gmp_proj = subproject('gmp-' + gmp_version)
  gmp_dep = gmp_proj.get_variable('gmp_dep')
  libdir = get_option('prefix') / get_option('libdir')
  extension_kwargs = {'install_rpath': libdir}
endif

if mpfr_version == ''
  mpfr_dep = dependency('mpfr', version: '>= 4.1.0', required: false)
else
  mpfr_proj = subproject('mpfr-' + mpfr_version)
  mpfr_dep = mpfr_proj.get_variable('mpfr_dep')
endif

deps = [gmp_dep, mpfr_dep]

py = import('python').find_installation(pure: false)

subdir('src')
