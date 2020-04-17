// Una función que crea con filas arbitrarias
// la matriz A de coeficientes y el vector b
// filas: El número de platos
// Vm: El multiplicador a la corriente de gas
// Lm: EL multiplicador a la corriente de aceite
function [A, b] = platesD(filas, Vm, Lm)

	// Constantes
	V=100*Vm
	L=500*Lm
	y0=0.09
	x0=0
	m=0.12

	// Vector b
	b = zeros(filas,1)
	b(1) = V*y0

	// Matriz de coeficientes
	_A = zeros(filas, filas+2)

	// La fila que forma el resto de filas
	fila = [-V*m L+m*V -L]
	fila3 = [-V*m L*1.25+m*V -L*1.25] // La fila 3 es especial

	// Repitiendo la misma fila pero con un padding de 0s
	for i = 1:filas
		if(i == 3)
			filaExt = [zeros(1, i-1) fila3 zeros(1, filas+2-3-(i-1))]
		else
			filaExt = [zeros(1, i-1) fila zeros(1, filas+2-3-(i-1))]
		end
		_A(i,:) = filaExt
	end

	// En la primera fila el -V*m no existe y en la última fila
	// el -L tampoco.
	A = _A(:,2:filas+1)
endfunction

filas=5

[A b] = platesD(filas,1,1)

printf('A:\n')
disp(A)
printf('\n')

printf('b:\n')
disp(b)
printf('\n')

rA = rank(A)
rAb = rank([A b])
[n _n] = size(b)

if(rA == rAb)
	if(rA == n)
		printf('Determinado\n')
	elseif(rA < n)
		printf('Indeterminado\n')
	end
else
	printf('Sin solución\n')
end
