%% Display congestion information
disp('------ Congestion Detection ------')

for i = 1:length(flows)

    if flows(i) > limits(i)

        fprintf('Line %d is congested\n', i);
        fprintf('Flow = %.2f MW\n', flows(i));
        fprintf('Limit = %.2f MW\n\n', limits(i));

    end

end