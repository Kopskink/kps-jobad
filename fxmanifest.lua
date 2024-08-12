fx_version 'cerulean'
game 'gta5'

version '1.0.0'
author 'kopskink'
description 'Super simple advertising system for jobs'

lua54 'yes'

client_scripts {
    'client/main.lua',
}

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua',
    'config.lua',
}
server_scripts {
    'server/main.lua',
}