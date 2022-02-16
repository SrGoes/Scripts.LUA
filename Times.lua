--Função criando os times
function createTeams() 
    teamPolicial = createTeam ( "Policial", 0, 0, 255 ) 
    teamBandido = createTeam ( "Bandido", 255, 0, 0 ) 
    teamMorto = createTeam ( "Morto", 255, 255, 255 )

end 
--Event handler para criar os times quando a Resource iniciar
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), createTeams ) 

--Função de setar o time de acordo com a skin do jogador
function setTeam() 
for id, player in ipairs(getElementsByType("player")) do 
--Se o jogador estiver com a Skin 0
if getElementModel(player ) == 0 then 
--Seta o time do jogador para o time morto
setPlayerTeam ( player , teamMorto) 
end 
end 
end 
--Timer que roda o script varias vezes a cada segundo e ativa a função de setar o time
setTimer(setTeam, 1000,-1) 
