clear;

s=1.83928675521416113; x=1.8;
eRel = zeros(9:1);

for k = 1:9
    x=power(1+x+x^2,1/3);
    eRel(k) = abs(x-s);
    fprintf('Iter %2d :: x=%.5f -> Erel %.1e \n',k,x,eRel(k));
end

K=eRel(end)./eRel(end-1);
semilogy(1:9,eRel,'bo-');
cifras = -log10(K);

primerosTresValores = eRel(2:4)./eRel(1:3);
x2=1.8;

eRel2 = zeros(9:1);
for k =1:9
    f= x2^3-x2^2-x2-1;
    fd = 3*x2^2-2*x2-1;
    x2 = x2-f/fd;
    eRel2(k) = abs(x2-s);
    fprintf('Iter %2d :: x2=%.5f -> Erel %.1e \n',k,x2,eRel2(k));
end

K2 = eRel2(2:end)./eRel2(1:end-1).^2;