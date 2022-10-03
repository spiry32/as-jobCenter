fx_version 'cerulean'
games {'gta5'}

description 'Job Center'
author 'Sp1ry32' -- For support: @Sp1ry#2599

shared_script 'config.lua'

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

client_scripts {
	"client_files/client.lua"
}
