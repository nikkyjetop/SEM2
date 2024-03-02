function [x, M] = find_int_roots(p)
    M = p;
    countZeros = 0;

% Nalezení nulových kořenů polynomu
    for j = 0:size(p, 2)
        if p(1, end - j) == 0
        % Zvýšíme počet nulových kořenů
            countZeros = countZeros + 1;  
        else
            % Nenulový kořen nalezen
            % Nalezne kořen a jeho násobky
            x = sort([divisors(M(1, end - j)) divisors(M(1, end - j))]);  
            % Změní znaménko u sudých násobků
            x(1, 2:2:end) = -1 * x(1, 2:2:end);  
            break;
        end
    end
	
   % Vytvoříme pole nulových kořenů
   zerosInPolynom(1, 1:countZeros) = 0;  

    if size(p, 2) < 2
        % Pokud máme pouze konstantní polynom, není zde žádný kořen
        x = [];  
    else
        i = 1;
        z = 0;
        newX = zeros(1, 3);
        while i <= size(x, 2)
            M(i + 1, 1) = M(i, 1);
            for y = 1:(size(M, 2) - 1)
            	% Použití Hornerova schématu
                M(i + 1, y + 1) = x(i) * M(i + 1, y) + M(i, y + 1);  
            end
            if M(i + 1, end - z) ~= 0
                M(i + 1, :) = M(i, :);
                x(i) = 0;
            elseif M(i + 1, end - z) == 0
                M(i, :) = M(i + 1, :);
                z = z + 1;
                 % Přidáme kořen do pole nulových kořenů
                newX(1, z) = x(1, i); 
                i = i - 1;
            end
            i = i + 1;
        end
        if countZeros >= 1
        	% Vytvoříme výsledné pole kořenů
            x = [zerosInPolynom, newX]';  
        else
       		% Odstraníme nuly z pole kořenů
            x = newX(find(newX ~= 0))';  
        end
    end

    % Věta o omezenosti kořenů
    if numel(x) > numel(p) - 1
        disp("Počet kořenů přesahuje stupeň polynomu.");
    end
end
