% Initialization
K_vals = [1, 5, 15, 50, 100]; % An array of packet sizes
N = 1000; % Number of iterations
p_vals = linspace(0.01, 0.99, 100); % Every equal value from 0.01 to 0.99

color = ["go","ro","ko","mo","bo"]; % Colors array

for K_index = 1:length(K_vals) % Run 5 times

% Initialization that need to reset every time
K = K_vals(K_index); % The current index in K-vals
simulatedResults = zeros(1,100); % Simulated results initialization

    % Calculate/Simulate plots and store the values
    for p_index = 1:length(p_vals) % Run 100 times
        p = p_vals(p_index); % The current index in p-vals
        simulatedResults(p_index) = runCompoundNetworkSim(K, p, N); % Input the simulated results on the iteration
    end

% Build single plot
figure('Position', [100, 100, 800, 600]); % Create a figure with a set size
semilogy(p_vals, simulatedResults, color(K_index), 'MarkerSize', 6); % Plot for the simulated results through p_vals

% Label the plot
title("Relations between Average Transmissions and Probability of Failure for Packets = " + K); % Big Title
xlabel("Probability of failure"); % Horizontal Title
ylabel("Average Transmissions"); % Vertical Title

% Build multi plot
bigFigure = figure(6); % Here to append proggressive results to a last figure
bigFigure.Position = [100, 100, 800, 600]; % Appended figure's size
semilogy(p_vals, simulatedResults, color(K_index), 'MarkerSize', 5); % Plot for the simulated results through p_vals
hold on; % Retains the above plots so that they don't get overwritten

% Label the plot
title("Relations between Average Transmissions and Probability of Failure"); % The Bigger's Big Title
xlabel("Probability of failure"); % Horizontal Title
ylabel("Average Transmissions"); % Vertical Title
fprintf('Done!\n'); % Prints in terminal to confirm this ran
end
