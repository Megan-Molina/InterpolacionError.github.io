function newton_interpolation()
    % Datos del ejemplo
    x = [1, 2, 3];
    y = [0, 0.6931472, 1.098612];

    % Punto a evaluar (ln(2) = f(2))
    x_eval = 2;

    % Calcular los coeficientes de Newton (diferencias divididas)
    n = length(x);
    coef = y;
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x(i) - x(i-j+1));
        end
    end

    % Evaluar el polinomio en x_eval
    result = coef(n);
    for i = n-1:-1:1
        result = result * (x_eval - x(i)) + coef(i);
    end

    % Mostrar el resultado
    fprintf('Estimación de ln(2) usando interpolación de Newton: %.7f\n', result);
    
    % Valor real
    real_ln2 = log(2);

    % Calcular error porcentual
    error = abs((real_ln2 - result) / real_ln2) * 100;
    fprintf('Error porcentual: %.6f%%\n', error);
end
