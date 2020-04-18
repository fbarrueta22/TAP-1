function ans = Crout(A)
    
    // Obtener dimensiones de la matriz
    [m, n] = size(A);
    
    // Comprobar que sea cuadrada
    if( m ~= n ) then
        error("La matriz debe ser cuadrada")
    end
    
    // L se inicializa como una copia de A
    L = A
    
    // U se inicializa como una matriz identidad de mxn
    U = eye(m,n)
    
    for i = 1:n-1
        for j = i+1:n
            U(i,j) = L(i,j)/L(i,i)            // Se llena la matriz U con los multiplicadores
            L(:,j) = L(:,j) - U(i,j)*L(:,i)   // Operaciones elementales por columnas
        end
    end

    ans = struct("L", L, "U", U)
    
endfunction
