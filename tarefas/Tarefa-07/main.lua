jogo = { nome = "Labirinto de fogo" }
jogador = {}

-- Tarefa-07
-- Momento: Criação do array dinâmico
-- O array será populado randomicamente para informar as coordenadas (x,y) dos buracos, possui escopo global e existirá até o fechamento do jogo.
buracox = {}
buracoy = {}

function love.load()
	--SOM
	musica = love.audio.newSource ("Musicas/bigh.mp3")
	venceu = love.audio.newSource ("Musicas/venceu.mp3")
	buracon = love.audio.newSource ("Musicas/buracon.mp3")
	passoubarreira = love.audio.newSource("Musicas/passoubarreira.mp3")
	musica:setVolume(0.8)
	buracon:setVolume(1)
	musica:setPitch(1.0)
	musica:play()
	passoubarreira:setPitch(3.0)
	fogo = love.audio.newSource ("Musicas/Fogo.wav")
	fogo:setPitch(1.0)
	--IMAGEM
	chegada = love.graphics.newImage("imagens/chegada.png")
	background = love.graphics.newImage("imagens/background.png")
	love.window.setMode(500,500)

	jogador.x = 10
	jogador.y = 10
	jogador.width = 10
	jogador.height = 10
	boneco = love.graphics.newImage("imagens/Boneco.png")
	quantos = 0
	jogo.x = 10

end
function limpaburacos()

	-- Tarefa-07
	-- Momento: Reinciar Valores de posicionamento
	-- O array será populado com o valor 0, considerando esse o valor inicial de um (float\int).
	local i = 0
	while i <= #buracox do
		buracox[i] = 0
		buracoy[i] = 0
		i = i+1
	end
end

function geraquantos()

		quantos = math.random(1,2)*((jogador.x-10)/40)
end

function love.update(dt)

    --CHEGOU NA LINHA DE CHEGADA!
	if (jogador.x >= love.graphics.getWidth( )-50) and (jogador.y >= love.graphics.getHeight( )-57)	then
		musica:stop()
		venceu:setVolume(0.5)
		venceu:play()
		love.graphics.print("Parabéns!",love.graphics.getWidth( )/2,love.graphics.getHeight( )/2)
		musica:pause()
		love.timer.sleep(3)


	--VOLTA PRO COMEÇO DO JOGO
		jogador.x = 10
		jogador.y = 10
		musica:play()
		geraquantos()
		-- Tarefa-07
		-- Momento: Criação do array dinâmico
		-- O array será populado randomicamente para informar as coordenadas (x,y) dos buracos, possui escopo global e existirá até o fechamento do jogo.
		limpaburacos()
		geraburacos(0)
	end


	--MOVIMENTOS PARA A DIREITA
	if love.keyboard.isDown("right") and (jogador.x < love.graphics.getWidth( )-20 ) then
		--PRIMEIRA BARREIRA
		if (jogador.x == 100) then

			if (jogador.y > 450) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.1)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SEGUNDA BARREIRA
		elseif (jogador.x == 150) then

			if (jogador.y < 40) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.2)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--TERCEIRA BARREIRA
		elseif (jogador.x == 200) then

			if (jogador.y > 200) and (jogador.y < 250) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.3)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--QUARTRA BARREIRA
		elseif (jogador.x == 250) then

			if (jogador.y > 30) and (jogador.y < 80) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.4)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--QUINTA BARREIRA
		elseif (jogador.x == 300) then

			if (jogador.y > 455) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.5)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SEXTA BARREIRA
		elseif (jogador.x == 350) then

			if (jogador.y < 45) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.6)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end					
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SETIMA BARREIRA
		elseif (jogador.x == 400) then

			if (jogador.y > 35) and (jogador.y < 85) then
				jogador.x = jogador.x + 5
				passoubarreira:setVolume(0.7)
				passoubarreira:play()
				geraquantos()
				geraburacos(quantos)
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		else
			jogador.x = jogador.x + 5
			if colisaoburaco() then
				buracon:play()
				love.timer.sleep(3)
				limpaburacos()
				jogador.x = 10
				jogador.y = 10
			end

		end

	end

	--MOVIMENTOS PARA A ESQUERDA
	if love.keyboard.isDown("left") and (jogador.x > 10) then
				--PRIMEIRA BARREIRA
		if (jogador.x == 120) then

			if (jogador.y > 450) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SEGUNDA BARREIRA
		elseif (jogador.x == 170) then

			if (jogador.y < 40) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--TERCEIRA BARREIRA
		elseif (jogador.x == 220) then

			if (jogador.y > 200) and (jogador.y < 250) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--QUARTRA BARREIRA
		elseif (jogador.x == 270) then

			if (jogador.y > 30) and (jogador.y < 80) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--QUINTA BARREIRA
		elseif (jogador.x == 320) then

			if (jogador.y > 455) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SEXTA BARREIRA
		elseif (jogador.x == 370) then

			if (jogador.y < 45) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		--SETIMA BARREIRA
		elseif (jogador.x == 420) then

			if (jogador.y > 35) and (jogador.y < 85) then
				jogador.x = jogador.x - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			else
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			end
		else
			jogador.x = jogador.x - 5
			if colisaoburaco() then
				buracon:play()
				love.timer.sleep(3)
				limpaburacos()
				jogador.x = 10
				jogador.y = 10
			end
		end
	end

	--MOVIMENTOS PARA CIMA
	if love.keyboard.isDown("up") and (jogador.y > 10) then
		--PRIMEIRA BARREIRA
			if (jogador.y == 450) then

			if (jogador.x > 101) and (jogador.x < 120)  then
				jogador.x = 10
				jogador.y = 10
				fogo:play()

			else
				jogador.y = jogador.y - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--TERCEIRA BARREIRA
		elseif (jogador.y == 200) then

			if (jogador.x > 201) and (jogador.x < 220) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--QUARTRA BARREIRA
		elseif (jogador.y == 30) then

			if (jogador.x > 251) and (jogador.x < 270) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--QUINTA BARREIRA
		elseif (jogador.y == 455) then

			if (jogador.x > 301) and (jogador.x < 320)  then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--SETIMA BARREIRA
		elseif (jogador.y == 35) then

			if (jogador.x > 401) and (jogador.x < 420) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y - 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		else
			jogador.y = jogador.y - 5
			if colisaoburaco() then
				buracon:play()	
				love.timer.sleep(3)
				limpaburacos()
				jogador.x = 10
				jogador.y = 10
			end
		end
	end

	--MOVIMENTOS PARA BAIXO
	if love.keyboard.isDown("down") and (jogador.y < love.graphics.getHeight()-20 ) then
		--SEGUNDA BARREIRA
			if (jogador.y == 40) then

			if (jogador.x > 151) and (jogador.x < 170)  then
				jogador.x = 10
				jogador.y = 10
				fogo:play()

			else
				jogador.y = jogador.y + 5
				if colisaoburaco() then
					buracon:play()	
					love.timer.sleep(3)	
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--TERCEIRA BARREIRA
		elseif (jogador.y == 250) then

			if (jogador.x > 201) and (jogador.x < 220) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y + 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--QUARTRA BARREIRA
		elseif (jogador.y == 80) then

			if (jogador.x > 251) and (jogador.x < 270) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y + 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--SEXTA BARREIRA
		elseif (jogador.y == 35) then

			if (jogador.x > 351) and (jogador.x < 370)  then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y + 5
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		--SETIMA BARREIRA
		elseif (jogador.y == 75) then

			if (jogador.x > 401) and (jogador.x < 420) then
				jogador.x = 10
				jogador.y = 10
				fogo:play()
			else
				jogador.y = jogador.y + 5
				if colisaoburaco() then
					buracon:play()
					musica:pause()
					love.timer.sleep(3)
					limpaburacos()
					jogador.x = 10
					jogador.y = 10
				end
			end
		else
			jogador.y = jogador.y + 5
			if colisaoburaco() then
				buracon:play()
				love.timer.sleep(3)
				limpaburacos()
				jogador.x = 10
				jogador.y = 10
			end
		end

	end	
end

	function mostraburaco(buracox,buracoy)

		love.graphics.setColor(0,0,0)
		love.graphics.circle("fill",buracox,buracoy,10)
		love.graphics.setColor(0,0,255)
		love.graphics.circle("fill",buracox,buracoy,8)
		love.graphics.setColor(0,0,0)
		love.graphics.circle("fill",buracox,buracoy,6)
		love.graphics.setColor(0,0,255)
		love.graphics.circle("fill",buracox,buracoy,4)
		love.graphics.setColor(0,0,0)
		love.graphics.circle("fill",buracox,buracoy,2)
	end

	function geraburacos(quantos)
		local i = 0
		while i < quantos do
			-- Tarefa-07
			-- Momento: Criação de objetos no array
			-- Criados dinamicamente nos arrays buracox,buracoy
			-- possuem mesmo tamanho, porém sempre randómicos, por dependerem da variável dinâmica "quantos"
			-- são criados na chamada da função geraburacos e recalculados sempre que ela for chamada.
			buracox[i] = math.random(jogador.x +5, jogador.x + 100) 
			buracoy[i] = math.random(10, love.graphics.getHeight()-15)
			i = i+1;
		end
	end

	function colisaoburaco()
		entrouburaco = "true"
		local i = 0
		while i < quantos do
			if  (jogador.x >= buracox[i]-15) and (jogador.x <= buracox[i]+5)
			and (jogador.y>= buracoy[i]-15) and (jogador.y <= buracoy[i]+5) then
				return entrouburaco
			else
				end
			i= i+1;
		end
		i= i+1;
	end 


function love.draw()
	local show = 0
	--FUNDO DA TELA

	love.graphics.setColor(0,0,100)
	love.graphics.draw(background,10,10)
	
	--CONTORNO DO MAPA
	love.graphics.setColor(0,0,100)
	love.graphics.rectangle("fill",0,0,10,love.graphics.getWidth( ))
	love.graphics.rectangle("fill",0,0,love.graphics.getWidth( ),10)
	love.graphics.rectangle("fill",love.graphics.getWidth( )-10,0,10,love.graphics.getHeight())
	love.graphics.rectangle("fill",0,love.graphics.getHeight( )-10,love.graphics.getWidth( ),10)

	--BARREIRAS
	love.graphics.setColor(255,0,0)
	--PRIMEIRA BARREIRA
	love.graphics.rectangle("fill",110,10,10,440)
	--SEGUNDA BARREIRA
	love.graphics.rectangle("fill",160,50,10,440)
	--TERCEIRA BARREIRA
	love.graphics.rectangle("fill",210,10,10,190)
	love.graphics.rectangle("fill",210,260,10,230)
	--QUARTA BARREIRA
	love.graphics.rectangle("fill",260,10,10,20)
	love.graphics.rectangle("fill",260,90,10,400)
	--QUINTA BARREIRA
	love.graphics.rectangle("fill",310,10,10,445)
	--SEXTA BARREIRA
	love.graphics.rectangle("fill",360,45,10,445)
	--SETIMA BARREIRA
	love.graphics.rectangle("fill",410,10,10,25)
	love.graphics.rectangle("fill",410,85,10,405)

	--CHEGADA
    love.graphics.setColor(255,255,255)
	love.graphics.draw(chegada,love.graphics.getWidth( )-50, love.graphics.getHeight( )- 57 )
	--BONECO
	love.graphics.draw(boneco,jogador.x,jogador.y)

	--NOME DO JOGO
	love.graphics.setColor(255,255,0)
	love.graphics.print(jogo.nome,10,10)

	--BURACOS
	while show < quantos do
	mostraburaco(buracox[show],buracoy[show])
	show = show+1;
	end

end