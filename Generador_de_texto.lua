-- Generador de texto

-- Listas de palabras
local sustantivos = {"gato", "perro", "niño", "profesor", "auto", "libro", "mujer", "hombre"}
local verbos = {"corre", "salta", "come", "duerme", "lee", "escribe", "canta", "habla"}
local adjetivos = {"rapido", "lento", "alto", "inteligente", "feliz", "triste", "grande", "pequeño"}
local adverbios = {"rápidamente", "cuidadosamente", "felizmente", "lentamente", "silenciosamente"}

-- Función para generar una palabra aleatoria de una lista
local function generar_aleatorio(lista)
    return lista[math.random(1, #lista)]
end

-- Función para generar una oración
local function generar_oracion()
    local sustantivo = generar_aleatorio(sustantivos)
    local verbo = generar_aleatorio(verbos)
    local adjetivo = generar_aleatorio(adjetivos)
    local adverbio = generar_aleatorio(adverbios)
    
    return "El " .. sustantivo .. " " .. verbo .. " " .. adverbio .. " y es " .. adjetivo .. "."
end

-- Generar 5 oraciones aleatorias
math.randomseed(os.time())  -- Inicializa el generador de números aleatorios
for i = 1, 5 do
    print(generar_oracion())
end