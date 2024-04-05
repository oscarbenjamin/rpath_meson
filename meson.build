project(
  'meson-test', 'c', 'cython',
  meson_version: '>= 0.64.0',
  default_options: [
    'buildtype=debugoptimized',
    'c_std=c99',
  ]
)

gmp = dependency(
  'gmp',
  version: '>= 6.3.0',
)

py = import('python').find_installation(pure: false)

subdir('src')
