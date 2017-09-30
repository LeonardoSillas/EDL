posX = 350
posY = 250
function love.load()
	imagem = love.graphics.newImage( "Imagens/rato.png" )
end

function love.draw()
	love.graphics.draw(imagem,posX,posY)
	love.graphics.print("Leonardo Sillas Oliveira",300,200)
end