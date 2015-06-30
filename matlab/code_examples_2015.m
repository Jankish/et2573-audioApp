% Dessa stycken exempelkod förutsätter att sampelfrekvensen är samma 
% för alla ljudfiler. Om det inte är så behöver omvandling av
% sampelfrekvensen göras med t.ex. RESAMPLE.
% Koden ska ses i sitt sammanhang och är bara exempel på hur olika saker
% såsom inläsning, uppspelning, blockindelning m.m. kan lösas. 
%
% Exempelkod version 2, BTH ET2573, juni 2015
%

% Rensa gamla variabler och figurer:
close all
clear all
% Vi förutsätter nu att ljudfilerna vi använder har 8 kHz sampelfrekvens:
fs = 8000; 

% Läs in ljudfiler (se till att det blir rätt sökväg)
fileName1=('signals/baby-talking_8khz.wav');
xOrig1 = audioread(fileName1);
fileName2=('signals/ventilation_8khz.wav');
xOrig2 = audioread(fileName2);
% Om sampelfrekvens behövs kan den läsas in såhär:
%    [xOrig1, fsOrig1] = audioread(fileName1);

% Lägg samman babyljud och störning:
LOrig1=length(xOrig1);
LOrig2=length(xOrig2);
xLen = min(LOrig1,LOrig2); % xLen är nu den kortaste längden
Nstrength = 2; % Styr hur stark störningen ska vara
disp('Adderad brusstyrka: '),disp(Nstrength)
x=xOrig1(1:xLen)+Nstrength*xOrig2(1:xLen);
% Lyssna och titta gärna på inläst ljud+störning:
sound(x) % kommandot förutsätter 8 kHz samlingsfrekvens
% figure(3), plot(x), title('Babyljud plus störning')

% Här nedan kan en algoritm läggas in som avgör om eller när larm ska ges,
% och då sätter igång alarmet.
% Signalen delas här upp i block om 160 sampel.

Px=zeros(1,xLen);
blen=160;  % Blocklängd
for ix=blen:blen:xLen
    % Gör här önskade beräkningar i blocket. 
    % Variabeln ix innehåller blockets slutpunkt.
    %%disp(ix)
    %
    % Som exempel visas här hur man tar fram medelvärdet av samplens
    % absolutbelopp inom detta block:
    Frameaverage=sum(abs(x(ix-blen+1:ix)))/blen;
    % Lägg in resultaten i en vektor, där hela blocket får samma värde,
    % vilket kan vara en fördel vid t.ex. plottning eller kommande
    % beräkningar (man kan naturligtvis välja även att spara bara ett värde
    % från varje block).
    Px(ix-blen+1:ix)=ones(1,blen)*Frameaverage;
    %
    % Här kan man nu välja att göra en test på det framräknade värdet och
    % avgöra om man vill ge larm. En kanske bättre metod är att bara spara
    % undan information om att blockets inehåll antyder att det kan vara
    % dags att ge larm, men att man väntar med att verkligen ge larm till
    % flera block visat detta.
    %
    %...
    %
end

% Plotta gärna lite för att få veta vad som sker:
figure(1)
subplot(311)
plot(xOrig1(1:xLen)), title('Babyljud')
subplot(312)
plot(x), title('Babyljud plus störning')
subplot(313)
plot(Px,'r'), title('Framräknat värde per block')


