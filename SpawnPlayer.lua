-- Configurações para quando um jogador entrar
	-- XYZ Coordenadas do spawn
	local joinX = 2040.901
	local joinY = -1414.51
	local joinZ = 17.171
	-- Skin do jogador
	local joinSkin = 0
	-- Dinheiro do jogador
	local joinMoney = 10000
	
-- Configuraçes para quando um jogador morrer
	-- XYZ Coordenadas de respawn
	local spawnX = 2040.901
	local spawnY = -1414.51
	local spawnZ = 17.171
	-- Skin do jogador ao respawnar
	local spawnSkin = 0

--Configurações para quando um jogador mata/morre por outro jogador
	-- Dinheiro por matar um jogador
	local killerMoney = 500
	-- O dinheiro retirado do jogador quando morre
	local deadPlayerMoney = 500

-- Funções
-- Função para spawnar o jogador
function spawnOnJoin()
	spawnPlayer(source, joinX, joinY, joinZ, 0 , joinSkin)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	givePlayerMoney(source, joinMoney)
end

-- Função para spawnar o jogador quando ele morrer
function spawnOnDead(ammo, killer, weapon, bodypart)
	takePlayerMoney(source, deadPlayerMoney)
	if (killer) and (killer ~= source) then
		givePlayerMoney(killer, killerMoney)
	end
	setTimer(spawnPlayer, 3000, 1, source, spawnX, spawnY, spawnZ, 0, spawnSkin)
	setCameraTarget(source, source)
end

-- Event handlers
addEventHandler("onPlayerJoin", getRootElement(), spawnOnJoin)
addEventHandler("onPlayerWasted", getRootElement(), spawnOnDead)