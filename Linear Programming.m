clear
i=0:5;
for y=i
f = [-60 -20];
A = [2 0.5; 4 1.5; 8 1; -1  0; 0  -1];
b = [8-1.5*y; 20-2*y; 48-6*y; 0;  0];
optSol = linprog(f,A,b);
maxProfit = -f*optSol+30*y;
end
%maxProfit has max value when y=0
clear
for y=0
x = 0:10;% range for graph
z1 = max((48-6*y-8*x),0);
z2 = max((20-2*y-4*x)/1.5,0); 
z3 = max((8-1.5*y-2*x)/0.5,0); 
%% Plot the constraints
figure(1)
subplot(2,2,1)
area(x,z1)
xlabel('x values')
ylabel('z values')
title('Lumber constraint')
axis([0 10 0 50])
subplot(2,2,2)
area(x,z2)
xlabel('x values')
ylabel('z values')
title('Finishing hours constraint')
axis([0 10 0 20])
subplot(2,2,3)
area(x,z3)
xlabel('x values')
ylabel('z values')
title('Carpentry constraint')
axis([0 10 0 20])
subplot(2,2,4)
area(x,min([z1;z2;z3]))
xlabel('x values')
ylabel('z values')
title('Feasible region')
axis([0 10 0 20])
%% Plot the contours of the objective function
display('Press any key to plot the feasible region and the objective function.')
%pause;
figure(2)
area(x,min([z1;z2;z3]))
xlabel('x values')
ylabel('z values')
title('Feasible region and contour lines of the objective function')
hold on;
[u,v] = meshgrid(0:10,0:20);
[c,h] = contour(u,v,60*u + 20*v,10,'LineWidth',2); % objective function
%clabel(c,h) % label the contour lines
contour3(u,v,60*u+20*v,100); % objective function
axis([0 10 0 20 0 50])
hold off;
%% Find the optimal solution
display('Press any key to find the optimal solution.')
%pause;
f = [-60 -20];
A = [2 0.5; 4 1.5; 8 1; -1  0; 0  -1];
b = [8-1.5*y; 20-2*y; 48-6*y; 0;  0];
optSol = linprog(f,A,b)
maxProfit = -f*optSol+30*y % compute maximum profit
%% Plot the solution
display('Press any key to plot the optimal solution.')
%pause;
figure(2)
hold on, plot(optSol(1),optSol(2),'ro','LineWidth',4)
zlabel('Objective function value')
end
