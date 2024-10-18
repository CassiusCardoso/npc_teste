local QBCore = exports['qb-core']:GetCoreObject()

-- Configuração do NPC
local npcInfo = {
    model = "a_m_m_business_01", -- Modelo do NPC (skin)
    coords = vector3(-429.3, 1120.45, 325.85), -- Coordenadas do NPC
    heading = 100.0, -- Direção para onde o NPC está virado
    scenario = "WORLD_HUMAN_GUARD_STAND" -- Animação padrão do NPC
}

-- Função para criar o NPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey(npcInfo.model))
    while not HasModelLoaded(npcInfo.model) do
        Wait(1)
    end

    -- Criar o NPC em local fixo
    local npc = CreatePed(4, npcInfo.model, npcInfo.coords.x, npcInfo.coords.y, npcInfo.coords.z, npcInfo.heading, false, true)
    TaskStartScenarioInPlace(npc, npcInfo.scenario, 0, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)