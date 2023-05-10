clear
load('soc_data.mat');

newX_05C=0:1:100;
newY_05C=interp1(curve05C(:,1),curve05C(:,2),newX_05C);
newX_1C=0:1:100;
newY_1C=interp1(curve1C(:,1),curve1C(:,2),newX_1C);
figure
hold on
plot(newX_1C,newY_1C,'green','DisplayName','1C')
plot(newX_05C,newY_05C,'red','DisplayName','0.5C')
xlabel('SOC [%]')
ylabel('Voltage  [V]')
legend
grid on

soc(1)=0.01;soc(2:10)=0.1:0.1:0.9;soc(11)=0.99;
Id_05C=(3200/2)*ones(1,11);
Id_1C=3200*ones(1,11);
%V for SOC=1%,10%,20%,30%,40%,50%,60%,70%,80%,90%,99%
V_05C=[2.6378,3.1548,3.2923,3.3869,3.4599,3.5295,3.6164,3.7118,3.8045,3.9152,4.0425];
V_1C=[2.5124,2.9446,3.1267,3.2283,3.3149,3.4004,3.4972,3.6055,3.7049,3.8144,3.9324];
%R and Voc 
R=(V_05C-V_1C)./(Id_1C-Id_05C);
Voc=V_1C+R.*Id_1C;

curveFitter


