% Načítanie dát zo súboru insurance.csv
data = readtable('insurance.csv');
% Konverzia stĺpcov, ktoré nie sú numerické, na reťazce
data.sex = convertCharsToStrings(data.sex);
data.smoker = convertCharsToStrings(data.smoker);
data.region = convertCharsToStrings(data.region);
% Rozdelenie dát na skupinu kuřáků a nekuřáků
smokers = data(data.smoker == "yes", :);
nonsmokers = data(data.smoker == "no", :);
% Získanie regresných priamok pre závislosť nákladov na veku
[k_age_smokers, q_age_smokers] = lin_regression(smokers.age, smokers.charges);
[k_age_nonsmokers, q_age_nonsmokers] = lin_regression(nonsmokers.age, nonsmokers.charges);
% Získanie regresných priamok pre závislosť nákladov na BMI
[k_bmi_smokers, q_bmi_smokers] = lin_regression(smokers.bmi, smokers.charges);
[k_bmi_nonsmokers, q_bmi_nonsmokers] = lin_regression(nonsmokers.bmi, nonsmokers.charges);
% Vykreslenie grafov
figure;
% Graf pre vek-náklady pre kuřákov
scatter(smokers.age, smokers.charges, 'b', 'filled');
hold on;
scatter(nonsmokers.age, nonsmokers.charges, 'r', 'filled');
xlabel('Věk');
ylabel('Náklady');
legend('Kuřáci', 'Nekuřáci');
% Regresná priamka pre kuřákov
x_age = min(data.age):max(data.age);
y_age_smokers = k_age_smokers * x_age + q_age_smokers;
plot(x_age, y_age_smokers, 'b');
% Regresná priamka pre nekuřákov
y_age_nonsmokers = k_age_nonsmokers * x_age + q_age_nonsmokers;
plot(x_age, y_age_nonsmokers, 'r');
title('Závislost nákladů na věku');
saveas(gcf, 'graph_age.png');
% Graf pre BMI-náklady pre kuřákov
figure;
scatter(smokers.bmi, smokers.charges, 'b', 'filled');
hold on;
scatter(nonsmokers.bmi, nonsmokers.charges, 'r', 'filled');
xlabel('BMI');
ylabel('Náklady');
legend('Kuřáci', 'Nekuřáci');
% Regresná priamka pre kuřákov
x_bmi = min(data.bmi):max(data.bmi);
y_bmi_smokers = k_bmi_smokers * x_bmi + q_bmi_smokers;
plot(x_bmi, y_bmi_smokers, 'b');
% Regresná priamka pre nekuřákov
y_bmi_nonsmokers = k_bmi_nonsmokers * x_bmi + q_bmi_nonsmokers;
plot(x_bmi, y_bmi_nonsmokers, 'r');
title('Závislost nákladů na BMI');
saveas(gcf, 'graph_bmi.png');

%Conclusion text
% Smernice k_age_smokers a k_age_nonsmokers udávajú rýchlosť rastu nákladov 
% na zdravotnú starostlivosť vzhľadom na vek pre obe skupiny. 
% Z tohto pozorovania môžeme povedať, že kurřáci majú v priemere rýchlejší 
% nárast nákladov, vzhľadom na vek. Tzn. čím si starší a k tomu kouříš,
% tým viac stojíš štát peniaze.
% Kuřáci majú v priemere rýchlejší nárast nákladov na zdravotnú 
% starostlivosť vzhľadom na BMI.