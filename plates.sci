// Una función que crea con filas arbitrarias
// la matriz A de coeficientes y el vector b
// filas: El número de platos
// Vm: El multiplicador a la corriente de gas
// Lm: EL multiplicador a la corriente de aceite
function [A, b] = plates(filas, Vm, Lm)

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

	// Repitiendo la misma fila pero con un padding de 0s
	for i = 1:filas
		_A(i,:) = _A(i,:) + [zeros(1, i-1) fila zeros(1, filas+2-3-(i-1))]
	end

	// En la primera fila el -V*m no existe y en la última fila
	// el -L tampoco.
	A = _A(:,2:filas+1)
endfunction
