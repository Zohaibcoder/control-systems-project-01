%%                                Case 03
%                            G(s) = 1 / (ms^2 + 2k)


% num3 = 1;
% den3 = [m 0 2*k];
% G3 = tf(num3,den3);

num3 = 1;

%     -------------------- t1 --------------------
% m = 1 , 2k = 2
den3_1 = [1 0 2];

% ---------------- Combined Effect ----------------

% t2 : Increase Mass and Spring Constant
% den3_2 = [3 0 4];

% t3 : Increase Spring Constant and Mass
den3_2 = [2 0 6];

% --------------- Single Parameter Effect ---------------

% tmo : Only Spring Constant Changes (m constant)
den3_3 = [1 0 6];

% tko : Only Mass Changes (k constant)
% den3_3 = [3 0 2];

% Transfer Functions

G3_1 = tf(num3,den3_1);
disp('t1 Poles')
p1 = pole(G3_1)

G3_2 = tf(num3,den3_2);
disp('t3 Poles')
p3 = pole(G3_2)

G3_3 = tf(num3,den3_3);
disp('tmo Poles')
pmo = pole(G3_3)

