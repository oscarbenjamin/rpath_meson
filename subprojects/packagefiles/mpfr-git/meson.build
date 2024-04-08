project('gmp', 'c',
  meson_version: '>= 0.65.0',
  license: ['LGPL-3.0-only', 'GPL-2.0-only'],
)

mod = import('unstable-external_project')

p = mod.run_command('./.bootstrap')

p = mod.add_project('configure',
  configure_options: [
    '--enable-maintainer-mode',
    '--enable-fat',
    '--enable-shared=yes',
    '--enable-static=no',
  ],
)

gmp_dep = p.dependency('gmp')
