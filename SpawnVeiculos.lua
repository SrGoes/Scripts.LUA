--Criando Clips
spawnM = createMarker(1705.803, -1085.078, 22.906, "cylinder", 1.5, 0,0,255,50)
destroyM = createMarker(1688.212, -1085.325, 22.906, "cylinder", 3, 255,0,0,50)

--Função que alerta o player sobre como pegar o veiculo
function msg(player)
    outputChatBox("[INFO] Para pegar o veiculo digite /Comando. ", player, 255,255,255, true)
end
--Event Handler para quando o jogador passar pelo Clip
addEventHandler("onMarkerHit", spawnM, msg)

veh = {}

--Função que spawna o veiculo| Destroi o veiculo caso o player ja tenha um
function spawnVehicle(player)
    --Definindo que só será possivel spawnar o veiculo se o player estiver no clip
    if isElementWithinMarker(player, spawnM) then
        --Verificando se o player ja possui um veiculo e destruindo o mesmo caso ele tente pegar outro
        if veh[player] and isElement( veh[player] ) then destroyElement(veh[player])
            veh[player] = nil
        end
        --Parte da função que define qual e onde o veiculo vai spawnar.
        veh[player] = createVehicle(596,1691.134, -1069.316, 23.906)
        --E colocando o player para dentro do  veiculo.
        warpPedIntoVehicle(player, veh[player])
    end
end
addCommandHandler("Comando", spawnVehicle)

--Função que destroi o veiculo quando passa pelo clip
function destroy(player)
    --Se o jogador estiver no clip
    if isElementWithinMarker(player, destroyM) then
        --E estiver em um carro, o carro é destruido e ele é avisado no chat
        if isPedInVehicle(player) == true then
        destroyElement(veh[player])
        outputChatBox("[INFO] Vtr destruida com sucesso!", player, 255,255,255, true)
        else --Caso o jogador não esteja em um carro ele é avisado no chat
        outputChatBox("[INFO] Voce nao esta em um veiculo", player, 255,255,255, true)
    end
end
end
--Event handler para destruir o carro
addEventHandler("onMarkerHit", destroyM, destroy)