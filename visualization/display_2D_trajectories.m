function h = display_2D_trajectories(XY, FI, bd_box, frac_to_display)


DEFAULT_COLOR = 'g-';
if nargin < 4
    frac_to_display = 1;    
end
if nargin < 3
    bd_box = [];
end
if nargin < 2 || isempty(FI)
    FI = ones(1, size(XY, 1));
end

numTraj = size(XY,1);
r = randperm(numTraj);
randInds = r(1:floor(frac_to_display*numTraj));
hold on;
for i=randInds

    plot(XY(i,2*FI(i)-1), XY(i,2*FI(i)), 'r*', 'MarkerSize',6,'LineWidth',1.5);
    X = XY(i,2*FI(i)-1:2:end);
    Y = XY(i,2*FI(i):2:end);
    plot(X, Y, DEFAULT_COLOR, 'LineWidth',1.5);
  
end

if ~isempty(bd_box)
    xmin   = bd_box(1);
    ymin   = bd_box(2);
    w      = bd_box(3);
    h      = bd_box(4);
    bd_box = [xmin ymin w h];
    r = rectangle('Position', bd_box); 
    set(r, 'EdgeColor', 'c');
end

h = gcf;
axis equal;
hold off;