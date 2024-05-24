os.execute('chcp 65001')

local p = [[insira o texto aqui]]

local fernandoResultado = {}

for k in p:gmatch('[çáóíúéâêîôûãõàÁÉÍÓÚÂÊÎÔÛÃÕÇÀ%-%a]+') do
	fernandoResultado[#fernandoResultado+1] = k
end

print(#fernandoResultado..' | esse é o número de palavras')

local media = (fernandoResultado[1]:len())

for i=2, #fernandoResultado do
	media = (media+fernandoResultado[i]:len())
end

media = media/#fernandoResultado

print(media..' | esse é a média de letras por palavra')
-------------------------------------------------
local desvioPadrao = 0
local d = {}

for i=1, #fernandoResultado do
	d[#d+1] = fernandoResultado[i]:len()-media
end

for i=1, #d do
	desvioPadrao = desvioPadrao+d[i]
end

print(math.sqrt(desvioPadrao)/#fernandoResultado..' | esse é o desvio padrão')
-------------------------------------------------
local f = {}

setmetatable(f, {__index = function()
   return 0
end})

for i=1, #fernandoResultado do
	f[fernandoResultado[i]:len()] = f[fernandoResultado[i]:len()]+1
end

for i=1, #f do
	print(f[i],(' | essa é a frequência relativa de palavras de %s letra(s)'):format(i))
end
-------------------------------------------------
local mediana

if fernandoResultado ~= math.floor(#fernandoResultado) then
	mediana = {fernandoResultado[math.floor(#fernandoResultado/2)], fernandoResultado[math.ceil(#fernandoResultado/2)]}
else
	mediana = #fernandoResultado/2
end

print((type(mediana) == 'string' and mediana or (mediana[1]..', '..mediana[2]))..' | essas são as medianas')
