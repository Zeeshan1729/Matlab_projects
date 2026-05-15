%% Improved Iterative Congestion Mitigation

disp('------ Improved Congestion Mitigation ------')

% Line limit
limit = mpc.branch(x,6);

% Initial flow
current_flow = abs(results.branch(x,14));

initial_flow = current_flow;

% Redispatch step size
step = 1;

% Iteration counter
iteration = 0;

% Safety limit
max_iter = 500;
% GSDF row of congested line
line_gsdf = GSDF_matrix(x,:);

% Ignore slack generator
line_gsdf(1) = 0;

% Generator with largest sensitivity magnitude
[~,gen_idx] = max(abs(line_gsdf));

% GSDF of selected generator
selected_gsdf = line_gsdf(gen_idx);

while current_flow > limit && iteration < max_iter

    if selected_gsdf > 0

        % Reduce generator
        mpc.gen(gen_idx,2) = ...
            mpc.gen(gen_idx,2) - step;

        % Increase slack
        mpc.gen(1,2) = ...
            mpc.gen(1,2) + step;

    else

        % Increase generator
        mpc.gen(gen_idx,2) = ...
            mpc.gen(gen_idx,2) + step;

        % Decrease slack
        mpc.gen(1,2) = ...
            mpc.gen(1,2) - step;

    end

    results_new = runpf(mpc,mpopt);

    current_flow = abs(results_new.branch(x,14));

    iteration = iteration + 1;

end