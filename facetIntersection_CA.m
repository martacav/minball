function alpha = facetIntersection_CA (Q2, R2, j, m, n, d, p, pm, x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author       : Marta Cavaleiro
% Description  : Finds the intersection of the line x+alpha*d with the facet 
%                opposed to point corresponding to index j    
% Input        : to see the input variables, go to lineSearch_CA.m
% Output       : alpha, the intersection value with the facet
% Last revised : March 2017

global epsTol
[Q3, R3] = qrdelete(Q2, R2, j, 'col');
if j == m
    [Q3, ~] = qrupdate(Q3, R3, pm-p, ones(m-1,1));
end
temp = d'*Q3(:, m:n);
i = find(abs(temp) > epsTol, 1);
alpha = ((p-x)'*Q3(:,i+m-1)) / temp(i);

end
