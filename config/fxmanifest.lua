fx_version 'cerulean'
game 'fiveM'

author 'Fluent City'
description 'NPC com comportamento customizado'
version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'npc_behavior.lua'
}

client_scripts {
    'npc_config.lua',
    'npc_interaction.lua'
}
