function U = LDA(data, labels)
X=data;
Labels=labels;

X_centered = X-repmat(mean(X),size(X,1),1);



classes= unique(Labels);
n_classes = size(classes,1);
cmeans = ones(n_classes, size(X,2));
Cn=zeros(n_classes,1);
%find means of classes
for i=1:n_classes
 X_temp = ones(1,size(X_centered,2));
 cur_class = classes(i);
 count=0;
 for j=1:size(Labels,1)
     if Labels(j)== cur_class
         count=count+1;
         X_temp(count,:)=X_centered(j,:);         
     end   
 end
 Cn(i) = count;
 cmeans(i,:) = mean(X_temp);
end
X_centered=X_centered';
N_ci = 5;
E_i = 1/N_ci*ones(N_ci);
a = E_i;
n = length(classes);
b = repmat({a},n,1);
M = blkdiag(b{:}); %get the M matrix
I = eye(size(X,1));
%(I-M)*(X_centered'*X_centered)*(I-M);
[C,L,V] = svd((X_centered*(I-M)));
L = L(1:271,1:271);
L=L^2;
V = V(:,1:271);
U = (X_centered*(I-M))*(V*inv(L));
X_b = U'*X_centered*M;
[Q,L1,C1] = svd(X_b);
W=U*Q;
U=W;


end