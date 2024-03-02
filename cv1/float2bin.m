% float2bin function
function b = float2bin(number, dec_length)
    cele = floor(number);
    desatinne = number - cele;
    binarnec = '';
    
   % Pokiaľ je celá časť nula, pridá 0 do binárneho reťazca
    if cele == 0
        binarnec = '0';
    else
        % Výpočet binárneho čísla pre celú časť
        while cele > 0
            zvysok = mod(cele, 2);
            binarnec = strcat(num2str(zvysok), binarnec);
            cele = fix(cele/2);
        end
    end

    % Ak existuje desatinná časť pridáme bodku
    if desatinne ~= 0
        binarnec = strcat(binarnec, '.');
        
        % Výpočet binárneho čísla pre desatinnú časť
        while (desatinne > 0) && (dec_length > 0)
            desatinne = desatinne * 2;
            bit = fix(desatinne);
            binarnec = strcat(binarnec, num2str(bit));
            desatinne = desatinne - bit;
            dec_length = dec_length - 1;
        end
    end
    
    b = binarnec;
end
