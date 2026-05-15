%% Final Results

fprintf('\nInitial Line Flow = %.2f MW\n', initial_flow);

fprintf('Final Line Flow = %.2f MW\n', current_flow);

fprintf('Line Limit = %.2f MW\n', limit);

fprintf('Total Iterations = %d\n', iteration);

if current_flow <= limit

    disp('Congestion Successfully Removed')

else

    disp('Congestion Still Exists')

end
%% Final System Line Flows

final_line_flows = abs(results_new.branch(:,14));

disp('------ Final System Line Flows ------')

disp(final_line_flows)