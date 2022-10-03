Citizen.CreateThread(function()
	RequestModel(GetHashKey(Config.npcModel))
	while not HasModelLoaded(GetHashKey(Config.npcModel)) do
		Wait(1)
	end
	RequestAnimDict("mini@strip_club@idles@bouncer@base")
	while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
		Wait(1)
	end
	FunctionCreateNPC = CreatePed(4, Config.npcModel, Config.NPCPos, false, true)
	PlaceObjectOnGroundProperly(NPC, true)
    FreezeEntityPosition(FunctionCreateNPC, true)
    SetEntityInvincible(FunctionCreateNPC, true)
    SetBlockingOfNonTemporaryEvents(FunctionCreateNPC, true)
    TaskPlayAnim(FunctionCreateNPC,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

	---- blips
	Citizen.CreateThread(function()
		if Config.blipEnabled then
			local blip = AddBlipForCoord(Config.Pos)
			SetBlipSprite(blip, Config.blipSprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.7)
			SetBlipColour(blip, Config.blipColor)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Job Center')
			EndTextCommandSetBlipName(blip)
		end
	end)
	----

	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local dst = #(coords - Config.Pos)
		if dst < 3.0 then
			DrawText3Ds(-264.1413269043,-965.74963378906,31.223907470703+.5, Config.Text)
			if dst < 2.0 then
				if IsControlJustPressed(0, 38) then
					OpenJobCenterMenu()
					Citizen.Wait(1000)
				end
			end
		end
	end
end)

function OpenJobCenterMenu()
    TriggerEvent("nh-context:joblisting")
end

RegisterNetEvent('nh-context:joblisting', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Job Center",
            txt = ""
        },
		{
            id = 6,
            header = "<i class='fa-solid fa-wheat-awn'></i>&nbsp;Somer",
            txt = "Nu faci absolut nimic.",
            params = {
                event = "job:somer",

            }
        },
        {
            id = 2,
            header = "<i class='fa-regular fa-gem'></i>&nbsp;Santierist",
            txt = "Stai si dai la picamer pana nu mai poti.",
            params = {
                event = "job:santierist",

            }
        },
		{
            id = 3,
            header = "<i class='fa-solid fa-recycle'></i>&nbsp;Gunoier",
            txt = "Mergi si trange toate sacii din tomberoane iar apoi intoarce-te la sediu pentru primit rasplata.",
            params = {
                event = "job:gunoier",

            }
        },
		{
            id = 4,
            header = "<i class='fa-solid fa-fish'></i>&nbsp;Pescar",
            txt = "Pescuiesti.Nimic mai mult.",
            params = {
                event = "job:pescar",

            }
        },
		{
            id = 4,
            header = "<i class='fa-solid fa-taxi'></i>&nbsp;Taxi",
            txt = "Preia comenzile clientilor si condu-i la locatia dorita",
            params = {
                event = "job:taxi",

            }
        },
		{
            id = 5,
            header = "<i class='fa-solid fa-wheat-awn'></i>&nbsp;Fermier",
            txt = "Du-te la ferma din Paleto si planteaza legumele cerute.<br><span style='color:#ffae00'>Ore : 25</span>",
            params = {
                event = "job:fermier",

            }
        },
		{
            id = 7,
            header = "<i class='fa-sharp fa-solid fa-mask'></i>&nbsp;Scafandru",
            txt = "Cauti corali in mare.Atentie! Poti gasi si obiecte ilegale!<br><span style='color:#ffae00'>Ore : 350</span>",
            params = {
                event = "job:scafandru",

            }
        },
		{
            id = 8,
            header = "<i class='fa-solid fa-lightbulb'></i>&nbsp;Electrician <span style='color:#ffae00'>[ ✨PROFITABIL ]</span>",
            txt = "Repara panourile stricate din Paleto Bay!<br><span style='color:#ffae00'>Ore : 10</span>",
            params = {
                event = "job:scafandru",

            }
        },
    })
end)
RegisterNetEvent("job:pescar", function()
	TriggerServerEvent("Getjob:pescar")
end)
RegisterNetEvent("job:santierist", function()
	TriggerServerEvent("Getjob:santierist")
end)
RegisterNetEvent("job:fermier", function()
	TriggerServerEvent("Getjob:fermier")
end)
RegisterNetEvent("job:gunoier", function()
	TriggerServerEvent("Getjob:gunoier")
end)
RegisterNetEvent("job:somer", function()
	TriggerServerEvent("somer")
end)
RegisterNetEvent("job:scafandru", function()
	TriggerServerEvent("Getjob:scafandru")
end)
RegisterNetEvent("job:taxi", function()
	TriggerServerEvent("Getjob:taxi")
end)
RegisterNetEvent("job:electrician", function()
	TriggerServerEvent("Getjob:electrician")
end)
function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
