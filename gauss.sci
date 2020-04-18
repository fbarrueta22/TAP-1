exec('plates.sci')
//funcion que soluciona por metodo de gauss sin pivoteo
function sol = gauss(A, b)

    [m,n] = size(A)     // Dimesiones de la matriz de entrada
    
    if (m <> n) then    // Comprueba si la matriz es cuadrada
        error("La matriz no es cuadrada.")
    end
    
    // Inicia el algoritmo
    for i = 1:n-1
         // Triangularizacion
        for j = i+1:n
            r = A(j,i)/A(i,i)
            A(j,:) = A(j,:) - r*A(i,:)
            b(j,:) = b(j,:) - r*b(i,:)
        end
    end
    
    // Sustitucion  inversa
    for j = n:-1:1
        suma = 0
        for k = j+1:n
            suma = suma + A(j,k)*x(k)
        end
        x(j) = ( b(j) - suma ) / A(j,j)
    end
    sol = x
   
endfunction

