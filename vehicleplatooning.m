clear all
clc
close all

x0=5*rand(6,1);
y0=5*rand(6,1);
theta0=2*pi*rand(6,1);

w0=[x0;y0;theta0];

time=[0 20];
[t,w]=ode23(@vehicles,time,w0);
x=w(:,1:6);
y=w(:,7:12);
theta=w(:,13:18);

plot(t,theta)
title('Headings vs Time')
xlabel('time')
legend('x1','x2','x3','x4','x5','x6')
figure
plot(x,y)
title('Position of the nodes vs Time')
xlabel('x')
ylabel('y')
legend('x1','x2','x3','x4','x5','x6')

function dw=vehicles(t,w)
theta=w(13:18);
L=[ 1 0 -1 0 0 0;-1 2 0 0 0 -1;-1 -1 2 0 0 0;0 -1 0 1 0 0;0 0 -1 0 1 0;0 0 0 -1 -1 2];
V=1;
dx=V*sin(theta);
dy=V*cos(theta);
dth=-L*theta;
dw=[dx;dy;dth];
end
