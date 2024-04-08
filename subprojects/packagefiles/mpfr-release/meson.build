project('mpfr', 'c',
  meson_version: '>= 0.65.0',
  version: '4.2.1',
  license: ['LGPL-3.0-only', 'GPL-2.0-only'],
)

mod = import('unstable-external_project')

gmp_dep = dependency('gmp', version: '>=6.3.0')

p = mod.add_project('configure',
  configure_options: [
    '--enable-shared=yes',
    '--enable-static=no',
  ],
)

mpfr_dep = p.dependency('mpfr')
meson.override_dependency('mpfr', mpfr_dep)
