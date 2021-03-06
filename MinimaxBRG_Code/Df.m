function [DNF] = Dnf(Pre,Post,Te1,MMBRG,w,k)
%**************************************************************************
%**************This function is to compute all markings******************
%***********that are reached by firing maximal firing implicit sequence from all minimax-basis markings****************
%**************************************************************************
[m,~] = size(Post);
Pre = [zeros(m,1),Pre];%%%%%Set fake implicit transition t1 with Pre(~,t1)=0;
Post = [zeros(m,1),Post];%%%%%Set fake implicit transition t1 with Post(~,t1)=0;
C = Post-Pre;
% [m,~]=size(C);
CI = C;
Te1 = Te1+1;
Te1 = [1,Te1];
CI(:,Te1) = [];
% [~,nu]=size(CI);  

MbM = [MMBRG{:,2}];%%%% The set of all minimax basis markings
[~,num] = size(MbM); %%% num=|MbM|
t = 1;
% YB=[];
Mall = [];
for i = 1:num
YB = m0212(Pre,Post,MbM(:,i),Te1,t);
[yb,~] = size(YB);
for j = 1:yb
%     if [MbM(:,i)+CI*(YB(j,:))']>=zeros(1,m)
Mall = [Mall,MbM(:,i)+CI*(YB(j,:))'];
%     end
end
end
MA = [unique(Mall', 'rows')]';

%**************************************************************************
%*********This sub-routine test if the above markings are dead markings******************
%**************************************************************************

[~,num] = size(MA); %%% num=|MbM|
[~,n] = size(Pre);
logic = 0;
MAD = [];
for i = 1:num
    for j = 1:n
logic =~isempty(find([MA(:,i)-Pre(:,j)]<0));
if logic == 1
    continue
else
    MAD = [MAD,MA(:,i)];
end
    end
end
TestDeadlock = [setdiff(MA',MAD', 'rows')]';

%**************************************************************************
%**************This sub-routine is to test if all the above dead markings are final****************
%**************************************************************************

[~,num] = size(TestDeadlock); %%% num=|MbM|
Test = 0;
for i = 1:num
if w'*MA(:,i) >= k+1
    DF = MA(:,i);
    fprintf('The system contains non-final deadlock!\n The system is blocking!\n');
    Test = Test+1;
    return
else
    continue
end
end
if Test == 0
   DF = [];
   fprintf('The system contains no non-final deadlock!\n'); 
end




end