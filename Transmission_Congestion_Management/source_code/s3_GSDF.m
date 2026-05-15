%% Full GSDF Matrix Calculation

disp('------ Full GSDF Matrix ------')

% Number of lines
num_lines = size(results.branch,1);

% Number of generators
num_gen = size(mpc.gen,1);

% Small generation perturbation
deltaP = 1;

% Store original line flows
original_flows = abs(results.branch(:,14));

% Initialize GSDF matrix
GSDF_matrix = zeros(num_lines,num_gen);

for g = 1:num_gen

    % Create temporary system
    mpc_temp = mpc;

    % Increase generator output
    mpc_temp.gen(g,2) = mpc_temp.gen(g,2) + deltaP;

    % Run power flow
    results_temp = runpf(mpc_temp,mpopt);

    % New line flows
    new_flows = abs(results_temp.branch(:,14));

    % Compute GSDF for all lines
    GSDF_matrix(:,g) = (new_flows - original_flows)/deltaP;

end

disp('GSDF Matrix:')
disp(GSDF_matrix)

%% Store Initial Line Flows

initial_line_flows = abs(results.branch(:,14));

disp('------ Initial System Line Flows ------')

disp(initial_line_flows)