clc;
clear;

% __________________________________________________________________________________________________________________________________
%|                                                                                                                                  |
%|                             The parameterized manufacturing example in resubmitted paper(Fig. 4)                                 |
%|__________________________________________________________________________________________________________________________________|

%Post matrix
Post = [
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,1,0,0,0,0,0,2,0,0,0,0,0,0,0,0;
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0;
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0;
0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3;
0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0;
0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0;
0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,0;
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0;
];

%Pre matrix
Pre = [
1,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0;
0,1,0,0,0,0,0,0,2,0,0,0,0,0,0,0;
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
0,1,1,0,0,0,0,2,0,0,0,0,0,0,0,0;
0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1;
0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0;
0,0,0,0,0,0,0,0,0,3,0,0,0,0,5,0;
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
];

%initial marking (one can change the token numbers)
M0 = [6 0 0 0 0 0 0 1 1 6 0 0 0 0 0 0 1 6 1 1 1 1]';

%Explicit transition set Te1 = {t3, t6, t11, t13}
Te1=[3 6 11 13];
% 
% %GMEC parameters w and k (characterizing the set of final markings MF)
% w = [0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0]';
% k = 7;
%**********************************************************************************************************************************



% __________________________________________________________________________________________________________________________________
%|                                                                                                                                  |
%|                  Benchmark I in Test_MinimaxBRG.pdf uploaded on GitHub: https://github.com/ChaoGu92/Minimax-BRG                  |
%|                  Case(1): Parameters: \alpha = 4, \beta = 3                                                                      |
%|__________________________________________________________________________________________________________________________________|

% %Pre matrix
% Pre = [
% 2,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1;
% 0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1;
% 0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,1;
% 0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,1,0;
% 0,0,0,0,0,0,0,0,0,1;
% ];
% 
% %Post matrix
% Post = [
% 0,0,0,0,0,0,0,0,0,1;
% 1,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0;
% 1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,1,0;
% ];
% 
% %initial marking (one can change the token numbers)
% M0 = [5;0;0;0;0;0;0;0;0;0;0;0;0];
% 
% %Explicit transition set Te1 = {t1}
% Te1 = [1];

% __________________________________________________________________________________________________________________________________
%|                                                                                                                                  |
%|                  Benchmark I in Test_MinimaxBRG.pdf uploaded on GitHub: https://github.com/ChaoGu92/Minimax-BRG                  |
%|                  Case(2): Parameters: \alpha = 4, \beta = 4                                                                      |
%|__________________________________________________________________________________________________________________________________|

%Pre matrix
% Pre = [
% 2,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% 0,0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% 0,0,0,0,0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% 0,0,0,0,0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% ];

%Post matrix
% Post = [
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0;
% ];

%initial marking (one can change the token numbers)
% M0 = [5;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];

%Explicit transition set Te1 = {t1}
% Te1 = [1];
%**********************************************************************************************************************************


% __________________________________________________________________________________________________________________________________
%|                                                                                                                                  |
%|                  Benchmark II in Test_MinimaxBRG.pdf uploaded on GitHub: https://github.com/ChaoGu92/Minimax-BRG                 |                                                                  |
%|__________________________________________________________________________________________________________________________________|

%Pre matrix
% Pre = [
% 0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1;
% 0,1,0,0,0,0,1,0,0,0,0,1,0;
% 0,0,1,0,0,0,0,1,0,0,1,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,1,0,0;
% ];

%Post matrix
% Post = [
% 1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0;
% 0,0,1,0,0,0,0,1,0,0,0,0,1;
% 0,0,0,1,0,0,0,0,1,0,0,1,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1;
% ];

%initial marking (one can change the token numbers)
% M0 = [0;0;0;0;0;0;0;0;0;0;3;2;2;2;6;6;6];

%Explicit transition set Te1 = {t3, t8, t12}
% Te1 = [3 8 12];



% __________________________________________________________________________________________________________________________________
%|                                                                                                                                  |
%|                  Benchmark III in Test_MinimaxBRG.pdf uploaded on GitHub: https://github.com/ChaoGu92/Minimax-BRG                |                                                                  |
%|__________________________________________________________________________________________________________________________________|


%Pre matrix
% Pre = [
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1;
% ];

%Post matrix
% Post = [
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; 
% 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0;
% 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0;
% ];

%Initial marking (one can change the token numbers)
% M0 = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 8, 1, 0, 0, 0, 0, 0]';

%Explicit transition set Te1 = {t1, t3, t7, t9, t14, t20, t22, t24, t29, t32, t35}
% Te1 = [1 3 7 9 14 20 22 24 29 32 35];




%Program 1: Test and compare the computational efficiency among RG and minimax-BRG on specific Petri net benchmarks
[TestEfficiency] = TestEfficiency(Pre,Post,M0,Te1);

%Program 2: Verify the nonblockingness of specific Petri net systems
%[Nonblokingness] = Nonblockingness(Pre,Post,M0,Te1,w,k);