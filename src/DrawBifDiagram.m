function DrawBifDiagram(@f,)
x = zeros(60,1);
x(1)
max_iterations = 100;
eps = 0.001;
diff = 1000;
hold on
idx = 1;
for r = 0:0.05:3
  i = 0
  while i < max_iterations & diff > eps
      
      i=i+1;
  end
  idx = idx + 1;
end
title('Bifurcation diagram of the logistic map');
xlabel('r');  ylabel('x*');
hold off;
