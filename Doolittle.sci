function ans = Doolittle(A)
    
    // Obtener dimensiones de la matriz
    [m, n] = size(A);
    
    // Comprobar que sea cuadrada
    if( m ~= n ) then
        error("La matriz debe ser cuadrada")
    end
    
    // U se inicializa como una copia de A
    U = A
    
    // L se inicializa como una matriz identidad de mxn
    L = eye(m,n)
    
    for i = 1:n-1
        for j = i+1:n
            L(j,i) = U(j,i)/U(i,i)            // Se llena la matriz L con los multiplicadores
            U(j,:) = U(j,:) - L(j,i)*U(i,:)   // Operaciones elementales por filas
        end
    end
    
    ans = struct("L", L, "U", U)
    
endfunction
