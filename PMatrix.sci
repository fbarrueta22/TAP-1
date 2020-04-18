exec('plates.sci')

// Una función que crea la matriz P de orden 6
function [P] = PMatrix()

	ORDER = 6

	// La misma matriz que en el ejercicio e
	[N, b] = plates(6, 1.25, 1.2)

	// Resultado
	P = zeros(ORDER, ORDER)

	for i = 1:ORDER
		for j = 1:ORDER
			if( i == j)
				P(i,j) = N(i,j) - i*j
			else
				P(i,j) = N(7-i,j) - 1
			end
		end
	end
endfunction
