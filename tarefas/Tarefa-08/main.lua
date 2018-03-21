jogo = { nome = "Labirinto de fogo" }
buracox = {}
buracoy = {}

--Tarefa 08
--Descrição: Foram criadas as funções "closure"(Move,Get e Reincia) para utilização nos objetos criados a partir da chamada New. 
function new(x,y)
	local me = 
		{
		move = function (dx,dy)
					x = x + dx
					y = y + dy
					return x,y
				end,
		get = function ()
			return x,y
			end,
		reinicia = function()
			x = 10
			y = 10
			return x,y
			end
		}
	return me
end


function novo(x,y)
	local me = 
		{
		move = function (dx,dy)
					x = x + dx
					y = y + dy
					return x,y
				end,
		get = function ()
			return x,y
			end,
--Tarefa 08
--Descrição: corotina de movimentação da caixa "Bonus"  		
		coVoa = coroutine.create(function(dt)
      		while true do
      			me.move(5,0)
      			coroutine.yield()
      		end
    	end),
		}
	return me
end

--Tarefa 08
--Descrição: Objeto criado a partir da chamada New, podendo utilizar as closures.
local jogador = new(10,10)
local bonus = novo(10,10)

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

	jogador.width = 10
	jogador.height = 10
	boneco = love.graphics.newImage("imagens/Boneco.png")
	quantos = 0
	jogo.x = 10

	--BONUS
	bonus.imagem = love.graphics.newImage('imagens/bonus.png')

end
function limpaburacos()
	for i = #buracox, 1, -1 do
		table.remove(buracox,i)
		table.remove(buracoy,i)
	end
end

function geraquantos()
		local jogadorx,x = jogador.get()
		quantos = math.random(1,2)*((jogadorx-10)/40)
end

function love.update(dt)

	--Tarefa 08
	--Descrição: Inserindo em jogadorx e jogadory os valores retornados na função Get relacionada ao objeto jogador.
	local jogadorx,jogadory = jogador.get()
	----Tarefa 08
	--Descrição:Resume na corotina de vôo
	coroutine.resume(bonus.coVoa)

    --CHEGOU NA LINHA DE CHEGADA!
	if (jogadorx >= love.graphics.getWidth( )-50) and (jogadory >= love.graphics.getHeight( )-57)	then
		musica:stop()
		venceu:setVolume(0.5)
		venceu:play()
		love.graphics.print("Parabéns!",love.graphics.getWidth( )/2,love.graphics.getHeight( )/2)
		musica:pause()
		love.timer.sleep(3)


	--VOLTA PRO COMEÇO DO JOGO
		jogador.reinicia()
		musica:play()
		geraquantos()
		limpaburacos()
	end

	--MOVIMENTOS PARA A DIREITA
	if love.keyboard.isDown("right") and (jogadorx < love.graphics.getWidth( )-20 ) then
		--PRIMEIRA BARREIRA
		if (jogadorx == 100) then
			if (jogadory > 450) then
				--Tarefa 08
				--Descrição: atualizando somente o valor de x do objeto através da função move() pois só atribui valor ao dx
				jogador.move(5,0)
				passoubarreira:setVolume(0.1)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogadorx = 10
				jogadory = 10
				fogo:play()
				--Tarefa 08
				--Descrição: Usando a função reinicia para atribuir 10 ao valor das variáveis x e y do objeto jogador.
				jogador.reinicia()
				limpaburacos()
			end
		--SEGUNDA BARREIRA
		elseif (jogadorx == 150) then

			if (jogadory < 40) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.2)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--TERCEIRA BARREIRA
		elseif (jogadorx == 200) then

			if (jogadory > 200) and (jogadory < 250) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.3)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--QUARTRA BARREIRA
		elseif (jogadorx == 250) then

			if (jogadory > 30) and (jogadory < 80) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.4)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--QUINTA BARREIRA
		elseif (jogadorx == 300) then

			if (jogadory > 455) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.5)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--SEXTA BARREIRA
		elseif (jogadorx == 350) then

			if (jogadory < 45) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.6)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end					
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--SETIMA BARREIRA
		elseif (jogadorx == 400) then

			if (jogadory > 35) and (jogadory < 85) then
				jogador.move(5,0)
				passoubarreira:setVolume(0.7)
				passoubarreira:play()
				limpaburacos()
				geraquantos()
				geraburacos(quantos)
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		else
			jogador.move(5,0)
			if colisaoburaco() then
				buracon:play()
				limpaburacos()
				love.timer.sleep(3)
				limpaburacos()
				jogador.reinicia()
			end

		end

	end

	--MOVIMENTOS PARA A ESQUERDA
	if love.keyboard.isDown("left") and (jogadorx > 10) then
				--PRIMEIRA BARREIRA
		if (jogadorx == 120) then

			if (jogadory > 450) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--SEGUNDA BARREIRA
		elseif (jogadorx == 170) then

			if (jogadory < 40) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--TERCEIRA BARREIRA
		elseif (jogadorx == 220) then

			if (jogadory > 200) and (jogadory < 250) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--QUARTRA BARREIRA
		elseif (jogadorx == 270) then

			if (jogadory > 30) and (jogadory < 80) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--QUINTA BARREIRA
		elseif (jogadorx == 320) then

			if (jogadory > 455) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--SEXTA BARREIRA
		elseif (jogadorx == 370) then

			if (jogadory < 45) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		--SETIMA BARREIRA
		elseif (jogadorx == 420) then

			if (jogadory > 35) and (jogadory < 85) then
				jogador.move(-5,0)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			else
				jogador.reinicia()
				fogo:play()
				jogador.reinicia()
				limpaburacos()
			end
		else
			jogador.move(-5,0)
			if colisaoburaco() then
				buracon:play()
				love.timer.sleep(3)
				limpaburacos()
				jogador.reinicia()
			end
		end
	end

	--MOVIMENTOS PARA CIMA
	if love.keyboard.isDown("up") and (jogadory > 10) then
		--PRIMEIRA BARREIRA
			if (jogadory == 450) then

			if (jogadorx > 101) and (jogadorx < 120)  then
				jogador.reinicia()
				fogo:play()
				limpaburacos()

			else
				--Tarefa 08
				--Descrição: atualizando somente o valor de y do objeto através da função move() pois só atribui valor ao dy
				jogador.move(0,-5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--TERCEIRA BARREIRA
		elseif (jogadory == 200) then

			if (jogadorx > 201) and (jogadorx < 220) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,-5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--QUARTRA BARREIRA
		elseif (jogadory == 30) then

			if (jogadorx > 251) and (jogadorx < 270) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,-5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--QUINTA BARREIRA
		elseif (jogadory == 455) then

			if (jogadorx > 301) and (jogadorx < 320)  then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,-5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--SETIMA BARREIRA
		elseif (jogadory == 35) then

			if (jogadorx > 401) and (jogadorx < 420) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,-5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		else
			jogador.move(0,-5)
			if colisaoburaco() then
				buracon:play()	
				love.timer.sleep(3)
				limpaburacos()
				jogador.reinicia()
			end
		end
	end

	--MOVIMENTOS PARA BAIXO
	if love.keyboard.isDown("down") and (jogadory < love.graphics.getHeight()-20 ) then
		--SEGUNDA BARREIRA
			if (jogadory == 40) then

			if (jogadorx > 151) and (jogadorx < 170)  then
				jogador.reinicia()
				fogo:play()
				limpaburacos()

			else
				jogador.move(0,5)
				if colisaoburaco() then
					buracon:play()	
					love.timer.sleep(3)	
					limpaburacos()
					jogador.reinicia()
				end
			end
		--TERCEIRA BARREIRA
		elseif (jogadory == 250) then

			if (jogadorx > 201) and (jogadorx < 220) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--QUARTRA BARREIRA
		elseif (jogadory == 80) then

			if (jogadorx > 251) and (jogadorx < 270) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--SEXTA BARREIRA
		elseif (jogadory == 35) then

			if (jogadorx > 351) and (jogadorx < 370)  then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,5)
				if colisaoburaco() then
					buracon:play()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		--SETIMA BARREIRA
		elseif (jogadory == 75) then

			if (jogadorx > 401) and (jogadorx < 420) then
				jogador.reinicia()
				fogo:play()
				limpaburacos()
			else
				jogador.move(0,5)
				if colisaoburaco() then
					buracon:play()
					musica:pause()
					love.timer.sleep(3)
					limpaburacos()
					jogador.reinicia()
				end
			end
		else
			jogador.move(0,5)
			if colisaoburaco() then
				buracon:play()
				love.timer.sleep(3)
				limpaburacos()
				jogador.reinicia()
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
		local jogadorx,jogadory = jogador.get()
		while i < quantos do
			table.insert(buracox, math.random(jogadorx +5, jogadorx + 100))
			table.insert(buracoy, math.random(10, love.graphics.getHeight()-15))
			i = i+1;
		end
	end

	function colisaoburaco()
		entrouburaco = "true"

		local jogadorx,jogadory = jogador.get()
		for i = #buracox, 1, -1 do
			if  (jogadorx >= (buracox[i]-15)) and 
				(jogadorx <= (buracox[i]+5)) and 
				(jogadory >= (buracoy[i]-15)) and 
				(jogadory <= (buracoy[i]+5)) then
				return entrouburaco
			end
		end
	end 


function love.draw()
	local i = 0
	local a,b = bonus.get()
	--FUNDO DA TELA

	love.graphics.setColor(0,0,100)
	love.graphics.draw(background,10,10)
	--caixa
	love.graphics.setColor(255,255,255)
	love.graphics.draw(bonus.imagem, a, b)


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
	local jogadorx,jogadory = jogador.get()
	love.graphics.draw(boneco,jogadorx,jogadory)

	--BURACOS
	for i = #buracox, 1, -1 do
	mostraburaco(buracox[i],buracoy[i])
	end

end