local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_constructor")


RegisterServerEvent('Getjob:santierist')
AddEventHandler('Getjob:santierist', function()
	local user_id = vRP.getUserId({source})
	vRPclient.notify(user_id, {"Te-ai angajat cu succes ca si Santierist"})
	vRP.addUserGroup({user_id, "Santierist"})
end)

RegisterServerEvent('Getjob:pescar')
AddEventHandler('Getjob:pescar', function()
	local user_id = vRP.getUserId({source})
	vRP.addUserGroup({user_id, "Pescar"})
	vRPclient.notify(user_id, {"Te-ai angajat cu succes ca si Pescar"})
end)

RegisterServerEvent('Getjob:taxi')
AddEventHandler('Getjob:taxi', function()
	local user_id = vRP.getUserId({source})
	vRP.addUserGroup({user_id, "Taxi"})
	vRPclient.notify(user_id, {"Te-ai angajat cu succes ca si Taximetrist"})
end)

RegisterServerEvent('Getjob:electrician')
AddEventHandler('Getjob:electrician', function()
	local user_id = vRP.getUserId({source})
	local orejucate = vRP.getUserHoursPlayed({user_id})
	if orejucate >= 10 then
		vRP.addUserGroup({user_id, "Electrician"})
	else
		vRPclient.notify(user_id, {"Nu ai 10 ore"})
	end
end)

RegisterServerEvent('Getjob:gunoier')
AddEventHandler('Getjob:gunoier', function()
	local user_id = vRP.getUserId({source})
	vRP.addUserGroup({user_id, "Gunoier"})
	vRPclient.notify(user_id, {"Te-ai angajat cu succes ca si Gunoier"})
end)

RegisterServerEvent('Getjob:scafandru')
AddEventHandler('Getjob:scafandru', function()
	local user_id = vRP.getUserId({source})
	local orejucate = vRP.getUserHoursPlayed({user_id})
	if orejucate >= 350 then
		vRP.addUserGroup({user_id, "Scafandru Recuperator"})
	else
		vRPclient.notify(user_id, {"Nu ai 350 ore"})
	end
end)

RegisterServerEvent('Getjob:fermier')
AddEventHandler('Getjob:fermier', function()
	local user_id = vRP.getUserId({source})
	local orejucate = vRP.getUserHoursPlayed({user_id})
	if orejucate >= 25 then
		vRP.addUserGroup({user_id, "Fermier"})
	else
		vRPclient.notify(user_id, {"Nu ai 25 ore"})
	end
end)

RegisterServerEvent('somer')
AddEventHandler('somer', function()
	local user_id = vRP.getUserId({source})
	vRP.addUserGroup({user_id, "Somer"})
	vRPclient.notify(user_id, {"Acum esti un somer parlit"})
end)
