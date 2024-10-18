local QBCore = exports['qb-core']:GetCoreObject()

-- Função para buscar frases do NPC no MySQL
function GetNpcPhrases(npcId, situation)
    local result = MySQL.Sync.fetchAll('SELECT phrase FROM npc_phrases WHERE npc_id = @npc_id AND situation = @situation', {
        ['@npc_id'] = npcId,
        ['@situation'] = situation
    })
    return result
end

-- Evento para o NPC falar quando o jogador interagir
RegisterNetEvent('npc:speak')
AddEventHandler('npc:speak', function(npcId, situation)
    local phrases = GetNpcPhrases(npcId, situation)
    if phrases and #phrases > 0 then
        -- Escolhe uma frase aleatória da lista
        local randomIndex = math.random(1, #phrases)
        local phrase = phrases[randomIndex].phrase

        -- Exibe a frase no chat ou interface
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"NPC", phrase}
        })
    end
end)
