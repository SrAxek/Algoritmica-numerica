clear;
n = 10;
c = ones(n:1);
for k = 1: 10
    H = hilb(k);
    c(k) = cond(H);
end
semilogy(1:n, c);
s = rand(n,1); b = H*s; x = H\b; eRel = abs(x-s)/abs(s);

plot(1:n, 10 - ceil(log10(c)), 'b:'); hold on
plot(1:n, -log10(eRel), 'ro:'); hold off