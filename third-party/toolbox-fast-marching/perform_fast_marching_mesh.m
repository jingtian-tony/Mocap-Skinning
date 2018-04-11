function [D,S,Q] = perform_fast_marching_mesh(vertex, faces, start_points, options)


options.null = 0;
nverts = max(size(vertex));

end_points  = getoptions(options, 'end_points', []);
verbose     = getoptions(options, 'verbose', 1);
nb_iter_max = getoptions(options, 'nb_iter_max', Inf);
W       = getoptions(options, 'W', ones(nverts,1) );
L       = getoptions(options, 'constraint_map', []);
H       = getoptions(options, 'heuristic', []);
values  = getoptions(options, 'values', []);
dmax    = getoptions(options, 'dmax', 1e9);

I = find(L==-Inf); L(I)=-1e9;
I = find(L==Inf); L(I)=1e9;

nb_iter_max = min(nb_iter_max, 1.2*max(size(W)));

if size(vertex,1)>size(vertex,2)
    vertex = vertex';
end
if size(faces,1)>size(faces,2)
    faces = faces';
end
start_points = start_points(:);
end_points = end_points(:);


if exist('perform_front_propagation_mesh')~=0
    [D,S,Q] = perform_front_propagation_mesh(vertex, faces-1, W,start_points-1,end_points-1, nb_iter_max, H, L, values, dmax);
    Q = Q+1;
else
    error('You have to run compiler_mex before.');
end


I = find( D>1e8 );
D(I) = Inf;
