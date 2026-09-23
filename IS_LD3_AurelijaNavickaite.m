clc
clear all
close all 

x = 0.1:1/22:1; 
d = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2; 

plot(x,d,'*') %funkcijos rezas norimam gaut atsakymui

%tinklo inicializavimas

%tinklo inicializavimas 
%pirmas sluoksnis
c1= 0.1;
c2= 0.15;
r1= 0.4;
r2= 0.2;

%antras sluoksnis 
w1= rand(1);
w2= rand(1);
b1= rand(1);

eta=0.008; %learning rate cia
%Gauso funkcija: F = exp(-(x-c)^2/(2*r^2)));
%gausO FUNKCIJA 1 SLUOKSNIO
F1 = exp(-(x-c1).^2/(2*r1^2));
F2 = exp(-(x-c2).^2/(2*r2^2));
%feedforward
%tinkloatsakas
for iter=1:5000
    for i=1:length(x)

  %1sluoksnins
  %isejimo f-ja 1 sluoksnio
    y1 = F1(i);
    y2 = F2(i);
    %isejimo sluoksnio pasverta suma
    v= y1*w1+ y2*w2 + b1;
    %isejimo sluoksnio aktyvacija
    Y= v;
    %klaida
    e=d(i)-Y;

    %2 isejimo sluoksnis, klaidos gradidentas. tiesiog klaida
    delta= e; %tiesines f-jos isvestine yra 1
    
    %atnaujinami svoriai
    %2 isejimo sluosknio
    w1=w1+eta*delta*F1(i);
    w2=w2+eta*delta*F2(i);
    b1=b1+eta*delta;

    end
end


%tinklo testas su apmokytais taskais
x_new=0.1:1/22:1;
F1_new = exp(-(x_new-c1).^2/(2*r1^2));
F2_new = exp(-(x_new-c2).^2/(2*r2^2));

Y_new=zeros(1,length(x_new));
for i=1:length(x_new)
  
  %1sluoksnins
  %isejimo f-ja 1 sluoksnio
    y1 = F1(i);
    y2 = F2(i);
    %isejimo sl pasverta suma
    v= y1*w1+ y2*w2 + b1;
    %isejimo sluoksnio aktyvacija
    Y_new(i)= v;
   

end
hold on %2 atskirus grafikus padaryt poto
plot(x_new,Y_new,'r')
hold off
legend('Norimas atsakas (d)','Tinklo atsakas (Y)')
%taskiukai kas kur, legenda kas kur, daugiau neuronu, pabandyt su sigmode
%padaryt. testuot kiti duomenys


%% Tinklo testas 2 su 200 tasku 
x_test = 0.1:1/220:1; 
d_test = ((1 + 0.6*sin(2*pi*x_test/0.7)) + 0.3*sin(2*pi*x_test))/2; % tikrasis atsakas
 %gausO FUNKCIJA 1 SLUOKSNIO
F1_test = exp(-(x_test-c1).^2/(2*r1^2));
F2_test = exp(-(x_test-c2).^2/(2*r2^2));
Y_test=zeros(1,length(x_test));

for i=1:length(x_test)
    %1sluoksnins
  %isejimo f-ja 1 sluoksnio
    y1 = F1_test(i);
    y2 = F2_test(i);
    %isejimo sl pasverta suma
    v= y1*w1+ y2*w2 + b1;
    %isejimo sluoksnio aktyvacija
    Y_test(i)= v;
end
 
figure
plot(x_test,d_test,'b*')
hold on
plot(x_test,Y_test,'r')
hold off
legend('Norimas atsakas (d_test)','Tinklo atsakas (Y_test)')