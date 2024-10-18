-- Função para buscar frases de NPC do banco de dados
MySQL.ready(function()
    print("Conectado ao banco de dados!")
end)

-- Função para buscar as frases do NPC com base em uma situação específica
RegisterServerEvent('npc:getPhrases')
AddEventHandler('npc:getPhrases', function(npc_id, situation)
    local src = source  -- Identifica o jogador que fez a solicitação
    MySQL.Async.fetchAll('SELECT phrase FROM npc_phrases WHERE npc_id = @npc_id AND situation = @situation', {
        ['@npc_id'] = npc_id,
        ['@situation'] = situation
    }, function(result)
        if result[1] then
            -- Envia as frases para o cliente que solicitou
            TriggerClientEvent('npc:sendPhrases', src, result)
        else
            -- Caso não tenha encontrado nenhuma frase
            TriggerClientEvent('npc:sendPhrases', src, { "Sem frases disponíveis" })
        end
    end)
end)

-- Função para inserir uma nova frase no banco de dados
RegisterServerEvent('npc:addPhrase')
AddEventHandler('npc:addPhrase', function(npc_id, phrase, situation)
    MySQL.Async.execute('INSERT INTO npc_phrases (npc_id, phrase, situation) VALUES (@npc_id, @phrase, @situation)', {
        ['@npc_id'] = npc_id,
        ['@phrase'] = phrase,
        ['@situation'] = situation
    }, function(rowsChanged)
        if rowsChanged > 0 then
            print("Frase inserida com sucesso!")
        else
            print("Erro ao inserir a frase.")
        end
    end)
end)
