function U = PCA(data)
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

    
end