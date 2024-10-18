local npcId = 1 -- ID do NPC conforme o banco de dados
local npcCoords = vector3(-429.3, 1120.45, 325.85) -- Coordenadas do NPC
local isNearNpc = false

-- Função para detectar se o jogador está próximo do NPC
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - npcCoords)

        if distance < 3.0 then
            isNearNpc = true
            DrawText3Ds(npcCoords.x, npcCoords.y, npcCoords.z, '[E] Falar com NPC')

            if IsControlJustPressed(1, 38) then -- Tecla E
                TriggerServerEvent('npc:speak', npcId, 'greeting') -- Envia o evento para o servidor
            end
        else
            isNearNpc = false
        end

        Wait(0)
    end
end)

-- Função para desenhar o texto na tela
function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end
