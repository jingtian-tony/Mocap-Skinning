function visualize_physical_trajectories(all_traj, rectangles, len_traj, last_frame)

num_frames = size(all_traj, 2);

if nargin < 4,
    last_frame = num_frames - len_traj;
else
    last_frame = min(num_frames - len_traj, last_frame);    
end


for i=1:last_frame,

    in_frame = all_traj{i};
    
    if isempty( in_frame), continue; end;
    
    display_2D_trajectories(in_frame, [], rectangles(i, :));    
    
    axis equal;
    set(gca,'YDir','Reverse'); 
    pause(1/24);
    clf;
    hold off;
end

end