-> O que precisa ter para vincular o banco de dados:
instalar o mysql2 -> (npm install mysql2). Esse aqui o GPT falou que é o banco de dados mais utilizado no qb-core
instalar o mysql-async -> (npm install mysql-async). Esse aqui é para fazer a sincronização do server.cfg com o mysql

A pasta action é basicamente o comportamento do NPC
              Arquivos
                  |
npc_behavior.lua -> Busca as frases do NPC no MySQL pelo id da frase e vai gerando de forma aleatória as frases para o NPC, e, por fim, ele exibe a frase com a TrigglerClientEvent()
npc_interaction.lua -> É o comportamento jogador-npc. Quando o jogador chegar a uma distância de 3 metros o NPC vai exececutar os comandos

A pasta config é o arquivo (fxmanifest.lua) é responsavel por:
Ser um componente fundamental para o desenvolvimento de recursos (scripts, mods, etc.). Guarda as configs do mysql, scripts que são os arquivos

A pasta data é a criação da tabela que armazena as frases no banco de dados

A pasta dbcon é a conexão com o banco de dados (server.lua), a busca das frases que existem lá, e a inserção de novas frases

A pasta model é configuração da skin do NPC.
