function [x_opt, r_opt, iter, time] = minBallDualAlg_CA (P)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author       : Marta Cavaleiro
% Description  : Finds the minimum ball that encloses the points in P
%                following the Dearing and Zeck algorithm with a more
%                efficient implementation and using the new line search
%                developed by us
% Input        : P ~ matrix with the points in its columns
% Output       : x_opt ~ center of the minimum ball
%                r_opt ~ radius of the minimum ball
%                S_opt ~ support set of the minimum ball
%                iter ~ number of iterations
%                time ~ CPU time
% Last revised : March 2017

tic

global epsTol
epsTol = 10^-8;

m = size(P, 2);

if m==1
    x_opt = P;
    r_opt = 0;
    iter = 0;
    time = 0;
    return
end


%0. INITIALIZATION:
[Q, R] = qr([P(:,1), P(:,2)]);      
x = (P(:,1)+P(:,2))/2;              
z = 1/2*sqrt((P(:,1)-P(:,2))'*(P(:,1)-P(:,2)));

iter = 0;
isOpt = 0;
normsOfPsq = sum(P.^2, 1);


while isOpt == 0   
     iter = iter+1;
    
    %1. OPTIMALITY CHECK AND CHOICE OF THE POINT TO ENTER: the one that is
    %"more infeasible"
    distances = - 2*x'*P + normsOfPsq;
    [maxdist, ip] = max(distances);
    if sqrt(maxdist + x'*x) < z + epsTol   
        break;
    end
    p = P(:, ip);

    
    %2. UPDATE S
    [Q, R] = updateS_CA(Q, R, p, x);

    
    %3. SOLVING M(S and p)
    flag = 1;
    while flag ~= 0
        [x, flag] = lineSearch_CA (x, Q, R, p); 

        if flag == 0
            z = norm(x-p);
            break
        else
            [Q, R] = qrdelete(Q, R, flag, 'col');   
        end
    end
    [Q, R] = qrinsert(Q, R, 1, p, 'col'); 
end

x_opt = x;
r_opt = z;
time = toc;

end