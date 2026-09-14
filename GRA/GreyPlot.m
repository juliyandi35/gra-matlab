function  GreyPlot( etaSN)
y=etaSN'; yRs=y(:,1); yRb=y(:,2); yRe=y(:,3); yLs=y(:,4); yLb=y(:,5); yLe=y(:,6);
xlim([0 60]); axis off; hold on
 x=[1 5 9]';
plot(x, yRs,'s-', 10+x, yRb,'sq-',20+x, yRe,'sq-',30+x, yLs,'sq-',40+x, yLb,'sq-', 50+x, yLe,'sq-');
 %title('Taguchi plot of Stator Current /Is ', 'Fontsize', 14); 
 text(x(1),yRs(1),'  Rs1'); text(x(2),yRs(2),'  Rs2');text(x(3),yRs(3),'  Rs3');
 text(10+x(1),yRb(1),'  Rb1'); text(10+x(2),yRb(2),'  Rb2');text(10+x(3),yRb(3),'Rb3');
 text(20+x(1),yRe(1),'  Re1'); text(20+x(2),yRe(2),'  Re2');text(20+x(3),yRe(3),'  Re3');
 text(30+x(1),yLs(1),'  Ls1'); text(30+x(2),yLs(2),'  Ls2');text(30+x(3),yLs(3),'  Ls3');
 text(40+x(1),yLb(1),'  Lb1'); text(40+x(2),yLb(2),'  Lb2');text(40+x(3),yLb(3),'  Lb3');
 text(50+x(1),yLe(1),'  Le1'); text(50+x(2),yLe(2),'  Le2');text(50+x(3),yLe(3),'  Le3');
end

