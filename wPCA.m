function U = wPCA(data)

%     %data X nxm
     X = data;

%     %data centering
     X_centered = X-repmat(mean(X),size(X,1),1);
     X_centered=X_centered';

     %dot_product=X_centered'*X_centered;

     [V, L, C] = svd(X_centered);
     L=L(1:340,1:340);
     L=L^2;
     %[L1,I1] = sort(diag(L),'descend');
     %V2 = V(:, I1);
     U=X_centered*C*((L)^(-1/2));
     U=U*((L)^(-1/2));
%     %data X nxm
%     X = data;
%     %X=[1 4;2 5;3 6]
%     N=size(X,1);
%     %data centering
 %    X_centered = X-repmat(mean(X),size(X,1),1);
%     %XTX
 %    dot_product=X_centered'*X_centered;
%     %eigen analysis of XTX
     %[E,L] = eig(dot_product);
%[coeff, eigValueDiag] = eig(dot_product);
%[eigValues, idx] = sort(diag(eigValueDiag), 'descend');
%coeff = coeff(:, idx);

%     %try1=E*L*E';
%     %W -> eigenvectors mxm
%     W=X*E*((L)^1/2);
%     %choose dimensions
%     N=350;
%     
%     NewW=W(:,1:N);
%     
%     %return Wr
%     %U=NewW';
%     %U=W';
%     U=E(:,1:350);
    %real = pca(X);
 %   U=coeff(:,1:350);
%epsilon=0.00001
%U=diag(1./sqrt(diag(eigValueDiag) + epsilon)) *U; 
end