local wins = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
    {1, 4, 7},
    {2, 5, 8},
    {3, 6, 9},
    {1, 5, 9},
    {3, 5, 7}
}

local continue = true;

while continue do
    

    local grid = {
        { "1", 0 },
        { "2", 0 },
        { "3", 0 },
        { "4", 0 },
        { "5", 0 },
        { "6", 0 },
        { "7", 0 },
        { "8", 0 },
        { "9", 0 }
    }
    
    
    
    local check = true
    local userplay = 0
    local u = 2
    local full = false

    --LOOP DE TURNOS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    while check do
        --.............................................
        for i = 1, 255 do
            print()
        end
        full = false 
        
    --SELECCION DE TURNO........................................................
        if u == 1 then
            u = 2
        else  
            u = 1
        end

    --IMPRESION DE GRID........................................................
        print(grid[1][1] .. " | " .. grid[2][1] .. " | " .. grid[3][1])
        print("--|---|--")
        print(grid[4][1] .. " | " .. grid[5][1] .. " | " .. grid[6][1])
        print("--|---|--")
        print(grid[7][1] .. " | " .. grid[8][1] .. " | " .. grid[9][1])

    --SELECCION DE CASILLA........................................................................
        print("jugador " .. u .. ", Indique posicion para marcar (1-9): ")
        userplay = tonumber(io.read())
    
        if userplay == nil or userplay < 1 or userplay > 9 then
            print("Posicion no válida. ingrese un número entre 1 y 9...")
            userplay = tonumber(io.read()) 
        elseif grid[userplay][2] ~= 0 then 
            print("Posicion ya marcada, elige otra...")
            userplay = tonumber(io.read())   
        end

   --REGISTRO EN EL GRID............................... 
        grid[userplay][2] = u  
    
        if u == 1 then
            grid[userplay][1] = "\27[31mX\27[0m"  
        else
            grid[userplay][1] = "\27[34m0\27[0m"  
        end

    --CHECKEO DE VICTORIA......................................
        for _, winCombination in ipairs(wins) do
            if grid[winCombination[1]][2] == u and grid[winCombination[2]][2] == u and grid[winCombination[3]][2] == u then
                print("Jugador " .. u .. " gana!")
                print("Presiona 'Enter' para continuar...")
                io.read()
                check = false
                break
            end
        end

        for i = 1, 9 do
            if grid[i][2] == 0 then
                full = true
            end
        end

        if  full== false then 
            print("Se lleno el campo...")
            print("Presiona 'Enter' para continuar...")
            io.read()
            check = false  
        end
    --...........................................
    end
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
end