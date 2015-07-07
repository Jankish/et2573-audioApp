% Dessa stycken exempelkod f?ruts?tter att sampelfrekvensen ?r samma 
% f?r alla ljudfiler. Om det inte ?r s? beh?ver omvandling av
% sampelfrekvensen g?ras med t.ex. RESAMPLE.
% Koden ska ses i sitt sammanhang och ?r bara exempel p? hur olika saker
% s?som inl?sning, uppspelning, blockindelning m.m. kan l?sas. 
%
% Exempelkod version 2, BTH ET2573, juni 2015
%

% Rensa gamla variabler och figurer:
close all
clear all
% Vi f?ruts?tter nu att ljudfilerna vi anv?nder har 8 kHz sampelfrekvens:
fs = 8000; 

% L?s in ljudfiler (se till att det blir r?tt s?kv?g)
fileName1=('baby_signals/baby-talking_8khz.wav');
xOrig1 = audioread(fileName1);
fileName2=('noise_signals/ventilation_8khz.wav');
xOrig2 = audioread(fileName2);
% Om sampelfrekvens beh?vs kan den l?sas in s?h?r:
%    [xOrig1, fsOrig1] = audioread(fileName1);

% L?gg samman babyljud och st?rning:
LOrig1=length(xOrig1);
LOrig2=length(xOrig2);
xLen = min(LOrig1,LOrig2); % xLen ?r nu den kortaste l?ngden
Nstrength = 2; % Styr hur stark st?rningen ska vara
disp('Adderad brusstyrka: '),disp(Nstrength)
x=xOrig1(1:xLen)+Nstrength*xOrig2(1:xLen);
% Lyssna och titta g?rna p? inl?st ljud+st?rning:
sound(x) % kommandot f?ruts?tter 8 kHz samlingsfrekvens
% figure(3), plot(x), title('Babyljud plus st?rning')

% H?r nedan kan en algoritm l?ggas in som avg?r om eller n?r larm ska ges,
% och d? s?tter ig?ng alarmet.
% Signalen delas h?r upp i block om 160 sampel.

Px=zeros(1,xLen);
blen=160;  % Blockl?ngd
for ix=blen:blen:xLen
    % G?r h?r ?nskade ber?kningar i blocket. 
    % Variabeln ix inneh?ller blockets slutpunkt.
    %%disp(ix)
    %
    % Som exempel visas h?r hur man tar fram medelv?rdet av samplens
    % absolutbelopp inom detta block:
    Frameaverage=sum(abs(x(ix-blen+1:ix)))/blen;
    % L?gg in resultaten i en vektor, d?r hela blocket f?r samma v?rde,
    % vilket kan vara en f?rdel vid t.ex. plottning eller kommande
    % ber?kningar (man kan naturligtvis v?lja ?ven att spara bara ett v?rde
    % fr?n varje block).
    Px(ix-blen+1:ix)=ones(1,blen)*Frameaverage;
    %
    % H?r kan man nu v?lja att g?ra en test p? det framr?knade v?rdet och
    % avg?ra om man vill ge larm. En kanske b?ttre metod ?r att bara spara
    % undan information om att blockets ineh?ll antyder att det kan vara
    % dags att ge larm, men att man v?ntar med att verkligen ge larm till
    % flera block visat detta.
    %
    %...
    %
end

% Plotta g?rna lite f?r att f? veta vad som sker:
figure(1)
subplot(311)
plot(xOrig1(1:xLen)), title('Babyljud')
subplot(312)
plot(x), title('Babyljud plus st?rning')
subplot(313)
plot(Px,'r'), title('Framr?knat v?rde per block')


