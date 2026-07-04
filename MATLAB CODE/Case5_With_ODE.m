m = 1 ; 
k = 1 ; 
b = 1 ; 
F = 1 ; 

f = @(t,X) [X(2)
           (F-b*X(2)-k*X(1))/m] ; 
tSpan = [0 20];
X0 = [0 0]; 
[t,X] = ode45(f,tSpan,X0);

subplot(1,2,1)
plot(t,X(:,1),"LineWidth",2)
grid on 
xlabel("Time") ; ylabel("Amplitude")
title("ode45 Response")

subplot(1,2,2)
G = tf(1,[1 1 1]);
step(G,tSpan)