function plot_phase_portrait(t0,tf,n,f,xstart,xend,xstep,ystart,yend,ystep, linecolour, polar)
hold on
for i= xstart:xstep:xend
    for j= ystart:ystep:yend
        plot_trajectory(t0,tf,n,[i,j],f, linecolour, polar);
    end
end
if polar
    xlim([-5,5])
    ylim([-5,5])
else
    xlim([xstart - abs(.25*(xend-xstart)), xend + abs(.25*(xend-xstart))])
    ylim([ystart - abs(.25*(yend-ystart)), yend + abs(.25*(yend-ystart))])
end
hold off